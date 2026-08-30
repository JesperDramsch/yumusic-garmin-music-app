# Development Guide

This guide is for developers looking to contribute, build, or test YuMusic locally.

## Prerequisites
1. Download and install the [Garmin Connect IQ SDK](https://developer.garmin.com/connect-iq/sdk/).
2. Install the **Monkey C** extension for Visual Studio Code.
3. Generate a Developer Key (`developer_key.der`) via the Monkey C extension.
4. Use Connect IQ SDK 9.2.0 or newer when validating current builds.

## Building the App
YuMusic is compiled using the `monkeyc` compiler. The project configuration is managed by the `monkey.jungle` file, which tells the compiler where to find source code and resources.

To compile the app via command line for a specific device (e.g., Fenix 7):
```bash
monkeyc -d fenix7 -f monkey.jungle -y /path/to/your/developer_key.der -o app.prg
```

For low-memory Java runs, especially when compiling tests for newer devices, set a larger heap first:
```powershell
$env:JAVA_TOOL_OPTIONS='-Xmx2048m'
```

Known validation targets:
```powershell
monkeyc -d enduro3 -f monkey.jungle -y developer_key.der -o bin\yumusic-enduro3.prg
monkeyc -d venu2 -f monkey.jungle -y developer_key.der -o bin\yumusic-venu2.prg
```

## Running Tests
Build test programs with `-t`, start the simulator, then run `monkeydo` with `/t`:

```powershell
$env:JAVA_TOOL_OPTIONS='-Xmx2048m'
monkeyc -d enduro3 -f monkey.jungle -y developer_key.der -o bin\yumusic-enduro3-test.prg -t
monkeydo bin\yumusic-enduro3-test.prg enduro3 /t

monkeyc -d venu2 -f monkey.jungle -y developer_key.der -o bin\yumusic-venu2-test.prg -t
monkeydo bin\yumusic-venu2-test.prg venu2 /t
```

If `monkeydo` reports `Unable to connect to simulator`, start the Connect IQ simulator from VS Code or launch the SDK `connectiq` command, then retry.

## Running in the Simulator
1. Start the Connect IQ Simulator from VS Code (`Ctrl+Shift+P` -> `Monkey C: Start Simulator`).
2. Run the app (`F5` in VS Code).
3. **Important**: In the simulator Settings, ensure you test with **Use Device HTTPS Requirements** enabled to simulate real-world networking constraints.

## Architecture Notes
* **Audio Content Provider**: YuMusic operates as a Garmin Audio Content Provider. 
* **State Management**: The app uses `Toybox.Application.Storage` and `Toybox.Application.Properties` to manage playlists and auth tokens.
* **Sync Flow**: Syncing is initiated by the Garmin OS over Wi-Fi, calling `yumusicSyncDelegate.mc`. Downloads must provide a valid `Content-Length` and `audio/*` content type.
