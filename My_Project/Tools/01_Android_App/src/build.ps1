# 构建 1 路继电器 APK（Windows 命令行，无需 Android Studio / Gradle）
# 用法： powershell -ExecutionPolicy Bypass -File build.ps1
#
# 注意：Android 的 aapt2 / zipalign 对“含中文的绝对路径”不友好，
#      所以本脚本先切到脚本目录，全程使用相对 ASCII 路径。
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

function Step($name, $code) {
    if ($code -ne 0) { throw "步骤失败：$name (exit=$code)" }
    Write-Host "  OK  $name" -ForegroundColor Green
}

# ---------- 找 JDK ----------
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
if (-not $jdk) { throw "找不到 JDK（需要 bin\javac.exe）" }
$java = Join-Path $jdk "bin\java.exe"
$javac = Join-Path $jdk "bin\javac.exe"
$keytool = Join-Path $jdk "bin\keytool.exe"
Write-Host "JDK        : $jdk"

# ---------- 找 build-tools / android.jar ----------
$aapt2 = Get-ChildItem -Path "sdk" -Recurse -Filter "aapt2.exe" -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $aapt2) { throw "找不到 aapt2.exe（sdk\build-tools 没解压？）" }
$btRel = "sdk\" + $aapt2.Directory.Name
$zipalign = "$btRel\zipalign.exe"
$d8jar = "$btRel\lib\d8.jar"
$signjar = "$btRel\lib\apksigner.jar"
$androidJar = (Get-ChildItem -Path "sdk" -Recurse -Filter "android.jar" -ErrorAction SilentlyContinue |
    Where-Object { $_.Directory.Name -like "android-3*" } | Select-Object -First 1)
if (-not $androidJar) { throw "找不到 android.jar（sdk\platforms 没解压？）" }
$androidRel = "sdk\" + $androidJar.Directory.Name + "\android.jar"
Write-Host "build-tools: $btRel"
Write-Host "android.jar: $androidRel"

# ---------- 输出目录 ----------
if (Test-Path "out") { Remove-Item "out" -Recurse -Force }
New-Item -ItemType Directory -Path "out" | Out-Null

# ---------- 1. 编译资源 ----------
& "$btRel\aapt2.exe" compile --dir "app\res" -o "out\resources.zip"
Step "aapt2 compile" $LASTEXITCODE

# ---------- 2. 链接资源，生成基础 apk ----------
& "$btRel\aapt2.exe" link -o "out\base.apk" -I $androidRel --manifest "app\AndroidManifest.xml" "out\resources.zip" --auto-add-overlay --min-sdk-version 21 --target-sdk-version 34
Step "aapt2 link" $LASTEXITCODE

# ---------- 3. 编译 Java ----------
New-Item -ItemType Directory -Path "out\classes" | Out-Null
$sources = Get-ChildItem -Path "app\src" -Recurse -Filter "*.java" | ForEach-Object { $_.FullName }
& $javac -encoding UTF-8 --release 8 -nowarn -classpath $androidRel -d "out\classes" $sources
Step "javac" $LASTEXITCODE

# ---------- 4. dex ----------
New-Item -ItemType Directory -Path "out\dex" | Out-Null
$classFiles = Get-ChildItem -Path "out\classes" -Recurse -Filter "*.class" | ForEach-Object { $_.FullName }
& $java -cp $d8jar com.android.tools.r8.D8 --min-api 21 --lib $androidRel --output "out\dex" $classFiles
Step "d8 (dex)" $LASTEXITCODE
Write-Host ("      classes.dex: " + [math]::Round((Get-Item "out\dex\classes.dex").Length / 1KB, 1) + " KB")

# ---------- 5. 把 classes.dex 塞进 apk ----------
Copy-Item "out\base.apk" "out\unsigned.apk" -Force
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::Open((Resolve-Path "out\unsigned.apk"), "Update")
try {
    $entry = $zip.CreateEntry("classes.dex")
    $s = $entry.Open()
    try {
        $bytes = [System.IO.File]::ReadAllBytes((Resolve-Path "out\dex\classes.dex"))
        $s.Write($bytes, 0, $bytes.Length)
    } finally { $s.Close() }
} finally { $zip.Dispose() }
Write-Host "  OK  打包 classes.dex" -ForegroundColor Green

# ---------- 6. zipalign ----------
& $zipalign -f 4 "out\unsigned.apk" "out\aligned.apk"
Step "zipalign" $LASTEXITCODE

# ---------- 7. 签名 ----------
if (-not (Test-Path "relay-debug.keystore")) {
    & $keytool -genkeypair -keystore "relay-debug.keystore" -alias relaykey -storepass android -keypass android -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Relay Console, O=Local, C=CN"
    Step "keytool 生成签名证书" $LASTEXITCODE
}
& $java -jar $signjar sign --ks "relay-debug.keystore" --ks-pass pass:android --key-pass pass:android --out "out\relay-app.apk" "out\aligned.apk"
Step "apksigner sign" $LASTEXITCODE

# ---------- 8. 校验 ----------
& $java -jar $signjar verify --print-certs "out\relay-app.apk"
Step "apksigner verify" $LASTEXITCODE
& "$btRel\aapt2.exe" dump badging "out\relay-app.apk"
Step "aapt2 dump badging" $LASTEXITCODE

$size = [math]::Round((Get-Item "out\relay-app.apk").Length / 1KB, 1)
Write-Host ""
Write-Host "构建完成：$root\out\relay-app.apk  ($size KB)" -ForegroundColor Cyan
