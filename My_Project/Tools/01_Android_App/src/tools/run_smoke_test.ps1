# 桌面冒烟测试：不需要安卓设备，直接把两个界面在电脑上跑起来
# 用法： powershell -ExecutionPolicy Bypass -File tools\跑冒烟测试.ps1
#        powershell -ExecutionPolicy Bypass -File tools\跑冒烟测试.ps1 -Live relayapp/test/abc123
param(
    [string]$Live = ""
)
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location (Split-Path -Parent $root)      # 切到 源码\ 目录，全程相对路径

# ---- 找 JDK ----
$jdkCandidates = @(
    "E:\Xilinx\.xinstall\2025.1.1\tps\win64\jre21.0.1_12",
    "E:\Xilinx\.xinstall\DocNav\tps\win64\jre21.0.1_12",
    $env:JAVA_HOME,
    "C:\Program Files\Java\jdk-21",
    "C:\Program Files\Android\Android Studio\jbr",
    "$env:LOCALAPPDATA\stm32cube\bundles\adoptium-jre\21.0.8+9.st.2"
)
$jdk = $null
foreach ($c in $jdkCandidates) {
    if ($c -and (Test-Path (Join-Path $c "bin\javac.exe"))) { $jdk = $c; break }
}
if (-not $jdk) {
    $jc = Get-Command javac -ErrorAction SilentlyContinue
    if ($jc) { $jdk = Split-Path -Parent (Split-Path -Parent $jc.Source) }
}
if (-not $jdk) { throw "找不到 JDK（需要 bin\javac.exe）" }
Write-Host "JDK: $jdk"

# ---- 生成桩类 ----
python tools\gen_stubs.py
if ($LASTEXITCODE -ne 0) { throw "生成桩类失败" }

# ---- 编译 ----
New-Item -ItemType Directory -Force -Path "out\smoke" | Out-Null
$stubs = Get-ChildItem -Path "tools\stubs" -Recurse -Filter "*.java" | ForEach-Object { $_.FullName }
$appSrc = Get-ChildItem -Path "app\src" -Recurse -Filter "*.java" | ForEach-Object { $_.FullName }
& (Join-Path $jdk "bin\javac.exe") -encoding UTF-8 -nowarn --release 8 -d "out\smoke" $stubs $appSrc "tools\UiSmoke.java"
if ($LASTEXITCODE -ne 0) { throw "编译失败" }

# ---- 运行 ----
if ($Live) {
    & (Join-Path $jdk "bin\java.exe") -cp "out\smoke" harness.UiSmoke --live $Live
} else {
    & (Join-Path $jdk "bin\java.exe") -cp "out\smoke" harness.UiSmoke
}
Write-Host ""
if ($LASTEXITCODE -eq 0) {
    Write-Host "冒烟测试全部通过" -ForegroundColor Green
} else {
    Write-Host "冒烟测试有失败项，见上面 FAIL 行" -ForegroundColor Red
}
exit $LASTEXITCODE
