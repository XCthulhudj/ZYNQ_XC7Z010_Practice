# 下载构建 APK 需要的 Android 工具（只需跑一次，约 120 MB）
# 用法： powershell -ExecutionPolicy Bypass -File 准备工具.ps1
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

New-Item -ItemType Directory -Force -Path "dl" | Out-Null
New-Item -ItemType Directory -Force -Path "sdk" | Out-Null

$targets = @(
    @{ name = "build-tools_r36_windows.zip";  url = "http://dl.google.com/android/repository/build-tools_r36_windows.zip" },
    @{ name = "platform-34-ext7_r03.zip";     url = "http://dl.google.com/android/repository/platform-34-ext7_r03.zip" }
)

foreach ($t in $targets) {
    $file = Join-Path "dl" $t.name
    if ((Test-Path $file) -and (Get-Item $file).Length -gt 1000000) {
        Write-Host "已存在，跳过下载：$($t.name)"
    } else {
        Write-Host "下载 $($t.name) …"
        Invoke-WebRequest -Uri $t.url -OutFile $file -TimeoutSec 1800
        Write-Host ("  完成，" + [math]::Round((Get-Item $file).Length / 1MB, 1) + " MB")
    }
    Write-Host "解压 $($t.name) …"
    Expand-Archive -Path $file -DestinationPath "sdk" -Force
}

# 统一目录名，便于 build.ps1 查找
$bt = Get-ChildItem -Path "sdk" -Recurse -Filter "aapt2.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
$jar = Get-ChildItem -Path "sdk" -Recurse -Filter "android.jar" -ErrorAction SilentlyContinue | Select-Object -First 1
Write-Host ""
if ($bt -and $jar) {
    Write-Host "工具就绪：" -ForegroundColor Green
    Write-Host "  build-tools: $($bt.DirectoryName)"
    Write-Host "  android.jar: $($jar.FullName)"
    Write-Host ""
    Write-Host "接着运行： powershell -ExecutionPolicy Bypass -File build.ps1"
} else {
    Write-Host "解压后没找到 aapt2.exe 或 android.jar，请检查 dl 目录里的压缩包是否完整。" -ForegroundColor Yellow
}
