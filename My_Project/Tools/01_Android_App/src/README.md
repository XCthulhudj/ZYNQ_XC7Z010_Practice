# 源码说明（继电器 APP v1.3）

原生 Java，**没有第三方依赖**（不用 Gradle/AndroidX/MQTT 库），
MQTT 3.1.1 客户端是手写的，所以整个工程很小、可读、可审计。

```
app/
  AndroidManifest.xml          两个界面：MainActivity（主）+ SettingsActivity（设置）
  res/mipmap/ic_launcher.png   图标（由 mkicon.py 生成）
  src/com/relay/one/
    MainActivity.java          主界面：只放开关和常用动作
    SettingsActivity.java      设置：服务器 / 设备设置 / 开发者选项（折叠）
    RelayManager.java          MQTT 连接、状态、日志、自动重连、崩溃记录（单例）
    Mqtt.java                  手写 MQTT 3.1.1 客户端（CONNECT/SUBSCRIBE/PUBLISH/PING）
    Protocol.java              设备返回解析（纯 Java，可在桌面单测）
    Ui.java                    界面零件：圆角卡片、胶囊按钮、配色
test/com/relay/one/
  ProtocolTest.java            解析单测（31 项）
  MqttTest.java                真连公网 broker 的联调测试
tools/
  gen_stubs.py                 生成 Android UI 桩类（桌面跑界面的关键）
  UiSmoke.java                 冒烟测试：两个界面的生命周期 + 全部按钮 + 可选真连 broker
  run_smoke_test.ps1               一键编译并跑冒烟测试
build.ps1                      一条命令出 APK（aapt2 + javac + d8 + zipalign + apksigner）
prepare_tools.ps1                   下载 build-tools r36 + platform-34
relay-debug.keystore           签名证书（覆盖升级必须用同一个）
```

## 出包

```powershell
powershell -ExecutionPolicy Bypass -File prepare_tools.ps1     # 只做一次，下载约 120 MB 到 sdk\
powershell -ExecutionPolicy Bypass -File build.ps1
```

产物：`out\relay-app.apk`（用 `relay-debug.keystore` 签名，覆盖安装不会冲突）。

## 不用手机也能验证界面

这是本项目最有用的一条：`tools` 里有一套极简 Android UI 桩类，可以**在电脑上真跑**
`MainActivity` / `SettingsActivity` 的生命周期和每个按钮，专抓两类真机必崩的问题：

1. `ViewGroup.addView` 传入已经有父容器的 View（v1.2 前就是这么闪退的）；
2. `Activity.setContentView` 传入已经有父容器的 View；
3. 点击回调里的空指针。

```powershell
powershell -ExecutionPolicy Bypass -File tools\run_smoke_test.ps1
# 想顺便验证真连 broker：
powershell -ExecutionPolicy Bypass -File tools\run_smoke_test.ps1 -Live relayapp/test/abc123
```

## 两个桌面测试

```powershell
# 设备返回解析（不需要安卓设备）
javac -encoding UTF-8 --release 8 -d out\test app\src\com\relay\one\Protocol.java test\com\relay\one\ProtocolTest.java
java -cp out\test com.relay.one.ProtocolTest

# 真的连 broker.emqx.io:1883 收发
javac -encoding UTF-8 --release 8 -d out\test app\src\com\relay\one\Mqtt.java test\com\relay\one\MqttTest.java
java -cp out\test com.relay.one.MqttTest broker.emqx.io 1883
```

## 踩过的坑（改代码前先看）

- **主线程不能碰网络**：任何 `socket.write` 都要在后台线程，否则 `NetworkOnMainThreadException` 直接杀进程。
  `RelayManager` 里所有收发都走单线程 `io` 执行器。
- **`setContentView` 只能收没有父容器的 View**：`buildUi()` 必须返回最外层 `ScrollView`。
- **aapt2 / zipalign 不认含中文的绝对路径**：`build.ps1` 先切目录、全程用相对路径。
- **build-tools r34 的 d8 遇到匿名内部类会崩**：用 r36。
- **订阅和发布同主题**：broker 会把自己的发送也推回来，`RelayManager` 按内容 + 6 秒窗口过滤回显。
