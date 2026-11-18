# mqtt_switch.ps1 — 电脑上控制「远程开关MQTT」那台继电器（broker.emqx.io:1883，主题=设备ID）
#
# 指令表（APP 源码 + 实测反推）：
#   a1      第1路 导通（开）
#   b1      第1路 断开（关）        <-- 实测：发 b1 回 f1，所以 a1/b1 与直觉相反
#   c1/c1s  点动 1 秒 / 0.6 秒      c1=N  点动 N 秒
#   qc      查询（回 s!-51,f1,f2,...）    q1  静默查询
#   id / bbh / ssid               查设备ID / 固件版本 / WiFi 与内网IP
# 回包：n1 = 继电器1 导通，f1 = 继电器1 断开
#
# 用法：
#   .\mqtt_switch.ps1                            # 查状态
#   .\mqtt_switch.ps1 -Command on                 # 导通（发 a1）
#   .\mqtt_switch.ps1 -Command off                # 断开（发 b1）
#   .\mqtt_switch.ps1 -Command cycle -Seconds 10  # 断电 N 秒后重新上电（同一条连接上完成，最稳）
#   .\mqtt_switch.ps1 -Command pulse -Seconds 1
#   .\mqtt_switch.ps1 -Command raw -Raw "bbh"
param(
    [string]$Device = "d48c4934a2b1",
    [string]$Broker = "broker.emqx.io",
    [int]$Port = 1883,
    [ValidateSet("status", "on", "off", "pulse", "cycle", "raw")]
    [string]$Command = "status",
    [string]$Raw = "",
    [int]$Seconds = 10,
    [int]$ListenSeconds = 5,
    [int]$TimeoutMs = 10000,
    [int]$Retries = 5
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [Text.Encoding]::UTF8

# ---------- MQTT 3.1.1 最小实现 ----------
function Enc-Str([string]$s) {
    $b = [Text.Encoding]::UTF8.GetBytes($s)
    $out = New-Object byte[] ($b.Length + 2)
    $out[0] = [byte](($b.Length -shr 8) -band 0xFF)
    $out[1] = [byte]($b.Length -band 0xFF)
    [Array]::Copy($b, 0, $out, 2, $b.Length)
    return $out
}
function Enc-Len([int]$len) {
    $o = New-Object System.Collections.Generic.List[byte]
    do {
        $d = $len % 128
        $len = [math]::Floor($len / 128)
        if ($len -gt 0) { $d = $d -bor 0x80 }
        $o.Add([byte]$d)
    } while ($len -gt 0)
    return [byte[]]$o.ToArray()
}
function Send-Packet($stream, [byte]$header, [byte[]]$body) {
    $pkt = [byte[]](@($header) + (Enc-Len $body.Length) + $body)
    $stream.Write($pkt, 0, $pkt.Length)
    $stream.Flush()
}
function Read-Packet($stream) {
    $h = $stream.ReadByte()
    if ($h -lt 0) { return $null }
    $mult = 1; $len = 0
    do {
        $d = $stream.ReadByte()
        if ($d -lt 0) { return $null }
        $len += ($d -band 0x7F) * $mult
        $mult *= 128
    } while (($d -band 0x80) -ne 0)
    $buf = New-Object byte[] $len
    $off = 0
    while ($off -lt $len) {
        $n = $stream.Read($buf, $off, $len - $off)
        if ($n -le 0) { return $null }
        $off += $n
    }
    return [pscustomobject]@{ Header = $h; Data = $buf }
}
function Read-Publish($stream) {
    $p = Read-Packet $stream
    if (-not $p) { return $null }
    if ((($p.Header -shr 4) -band 0x0F) -ne 3) { return @{ Topic = ""; Msg = ""; Other = $true } }
    $tl = (($p.Data[0] -shl 8) -bor $p.Data[1])
    return @{
        Topic = [Text.Encoding]::UTF8.GetString($p.Data, 2, $tl)
        Msg   = [Text.Encoding]::UTF8.GetString($p.Data, 2 + $tl, $p.Data.Length - 2 - $tl)
    }
}
function Publish-It($stream, [string]$topic, [string]$payload) {
    $pb = New-Object System.Collections.Generic.List[byte]
    $pb.AddRange([byte[]](Enc-Str $topic))
    $pb.AddRange([Text.Encoding]::UTF8.GetBytes($payload))
    Send-Packet $stream 0x30 $pb.ToArray()
}
function Parse-Payload([string]$p) {
    $s = $p.Trim(); $out = @()
    if ($s -match 's!-(-?\d+)') { $out += "信号 $($matches[1]) dBm" }
    if ($s -match 'bbh[_-]?(\d+(\.\d+)+)') { $out += "固件 $($matches[1])" }
    foreach ($tok in [regex]::Matches($s, '[nf]\d+')) {
        $v = $tok.Value
        $out += ("继电器{0}={1}" -f $v.Substring(1), $(if ($v[0] -eq 'n') { "导通" } else { "断开" }))
    }
    if ($s -match 'SSID:\s*([^,]+),\s*([0-9.]+)') { $out += "WiFi $($matches[1]) / IP $($matches[2])" }
    foreach ($a in @('qkok', 'qgok', 'sdok', 'ksok', 'rest_ok', 'appz_ok')) {
        if ($s -like "*$a*") { $out += "回执 $a" }
    }
    if ($s -match '^\s*[0-9a-fA-F]{10,16}\s*$') { $out += "设备ID $($s.Trim())" }
    return ($out -join " ; ")
}
function Show-Msg([string]$msg) {
    Write-Host "$(Get-Date -Format 'HH:mm:ss')  $msg" -ForegroundColor Cyan
    $m = Parse-Payload $msg
    if ($m) { Write-Host "            -> $m" -ForegroundColor Yellow }
}
function Wait-For($stream, [string]$pattern, [int]$sec) {
    $deadline = (Get-Date).AddSeconds($sec)
    while ((Get-Date) -lt $deadline) {
        try { $m = Read-Publish $stream } catch { continue }
        if (-not $m) { return $false }
        if ($m.Other -or -not $m.Msg) { continue }
        Show-Msg $m.Msg
        if ($m.Msg -match $pattern) { return $true }
    }
    return $false
}
function Drain($stream, [int]$ms) {
    $deadline = (Get-Date).AddMilliseconds($ms)
    $stream.ReadTimeout = 200
    while ((Get-Date) -lt $deadline) { try { $null = Read-Publish $stream } catch { } }
    $stream.ReadTimeout = 1000
}

# ---------- 连接（带重试）----------
$clientId = "pcsw-" + (-join ((1..6) | ForEach-Object { "0123456789abcdef"[(Get-Random -Max 16)] }))
Write-Host "broker : $Broker`:$Port"
Write-Host "topic  : $Device"
Write-Host "mode   : $Command"
Write-Host "client : $clientId"

$tcp = $null; $stream = $null
for ($attempt = 1; $attempt -le $Retries; $attempt++) {
    try {
        if ($tcp) { try { $tcp.Close() } catch { } }
        $tcp = New-Object System.Net.Sockets.TcpClient
        $ar = $tcp.BeginConnect($Broker, $Port, $null, $null)
        if (-not $ar.AsyncWaitHandle.WaitOne($TimeoutMs)) { throw "TCP 超时" }
        $tcp.EndConnect($ar)
        $tcp.NoDelay = $true
        $stream = $tcp.GetStream()

        $body = New-Object System.Collections.Generic.List[byte]
        $body.AddRange([byte[]](Enc-Str "MQTT"))
        $body.Add(0x04); $body.Add(0x02)
        $body.Add(0x00); $body.Add(0x3C)
        $body.AddRange([byte[]](Enc-Str $clientId))
        Send-Packet $stream 0x10 $body.ToArray()

        $stream.ReadTimeout = $TimeoutMs
        $p = Read-Packet $stream
        if (-not $p -or (($p.Header -shr 4) -ne 2)) { throw "没收到 CONNACK" }
        if ($p.Data[1] -ne 0) { throw "broker 拒绝，返回码 $($p.Data[1])" }

        $sb = New-Object System.Collections.Generic.List[byte]
        $sb.Add(0x00); $sb.Add(0x01)
        $sb.AddRange([byte[]](Enc-Str $Device))
        $sb.Add(0x00)
        Send-Packet $stream 0x82 $sb.ToArray()
        $p = Read-Packet $stream
        if (-not $p -or (($p.Header -shr 4) -ne 9)) { throw "没收到 SUBACK" }

        Write-Host "已连接（第 $attempt 次尝试）" -ForegroundColor Green
        $stream.ReadTimeout = 1000
        break
    }
    catch {
        Write-Host "连接失败（第 $attempt 次）：$($_.Exception.Message)" -ForegroundColor DarkYellow
        if ($attempt -eq $Retries) { throw }
        Start-Sleep -Seconds 3
    }
}

try {
    if ($Command -eq "cycle") {
        Write-Host "`n== 1/3 当前状态 ==" -ForegroundColor White
        Publish-It $stream $Device "qc"
        $null = Wait-For $stream '[nf]1' 4
        Drain $stream 1200

        Write-Host "`n== 2/3 断电（b1）==" -ForegroundColor White
        Publish-It $stream $Device "b1"
        $offOk = Wait-For $stream 'f1' 6
        Drain $stream 800
        if (-not $offOk) { Write-Host "没等到 f1 回包，断电未确认" -ForegroundColor Red }

        Write-Host "`n== 等待 $Seconds 秒（保持连接）==" -ForegroundColor White
        1..$Seconds | ForEach-Object { Start-Sleep -Seconds 1; Write-Host -NoNewline "." }
        Write-Host ""

        Write-Host "`n== 3/3 重新上电（a1）==" -ForegroundColor White
        Publish-It $stream $Device "a1"
        $onOk = Wait-For $stream 'n1' 6
        Drain $stream 800

        Write-Host "`n== 最终状态 ==" -ForegroundColor White
        Publish-It $stream $Device "qc"
        $null = Wait-For $stream '[nf]1' 4

        Write-Host ""
        if ($offOk -and $onOk) { Write-Host "断电 → 上电 完成 ✔" -ForegroundColor Green }
        else { Write-Host "有步骤未确认（off=$offOk, on=$onOk）" -ForegroundColor Red }
    }
    else {
        $payload = switch ($Command) {
            "status" { "qc" }
            "on" { "a1" }
            "off" { "b1" }
            "pulse" { if ($Seconds -gt 0) { "c1=$Seconds" } else { "c1" } }
            "raw" { $Raw }
        }
        if (-not $payload) { throw "指令为空" }
        Write-Host "send   : $payload"
        Drain $stream 200
        Publish-It $stream $Device $payload
        $deadline = (Get-Date).AddSeconds($ListenSeconds)
        $n = 0
        while ((Get-Date) -lt $deadline) {
            try { $m = Read-Publish $stream } catch { continue }
            if (-not $m) { break }
            if ($m.Other -or -not $m.Msg -or $m.Msg -eq $payload) { continue }
            Show-Msg $m.Msg
            $n++
        }
        if ($n -eq 0) { Write-Host "设备没应答（不在线或主题不对）" -ForegroundColor Yellow }
    }
}
finally {
    try { Send-Packet $stream 0xE0 ([byte[]]@()) } catch { }
    try { $tcp.Close() } catch { }
}
