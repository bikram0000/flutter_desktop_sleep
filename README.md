# flutter_desktop_sleep

2022 © Bikramaditya Meher

[![Pub](https://img.shields.io/pub/v/flutter_desktop_sleep.svg)](https://pub.dartlang.org/packages/flutter_desktop_sleep) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/bikram0000/flutter_desktop_sleep/blob/master/LICENSE)

flutter_window_sleep lets you know your Flutter app if app going to close/sleep/wakeup and has a
chance to confirm if the user want to close there running task such as logout function, etc. It
works on desktop platforms including Windows and macOS. Thanks
to [flutter_window_close] (https://pub.dartlang.org/packages/flutter_window_close) it was help me
very much.

![macOS](https://img.shields.io/badge/mac%20os-000000?style=for-the-badge&logo=macos&logoColor=F0F0F0)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)

## Example

```dart
    FlutterDesktopSleep flutterDesktopSleep = FlutterDesktopSleep();
    flutterDesktopSleep.setWindowSleepHandler((String? s) async {
      Get.log('dsfsadf $s');
      if (s != null) {
        // autoClockOff(note: s, shouldThread: false, shouldOn: true);
        if (s == 'sleep') {
          autoClockOff(note: 'Laptop sleep', shouldOn: false);
        } else if (s == 'woke_up') {
          autoClockOff(note: 'Laptop woke up', shouldOn: true);
        } else if (s == 'terminate_app') {
          await autoClockOff(
              note: 'App Terminate', shouldThread: false, shouldOn: false);
          flutterDesktopSleep.terminateApp();
        }
      }
    });
```

## macOS

For macOs you need to add following code to your macos/Runner/AppDelegate.swift

```dart
import Cocoa
import FlutterMacOS
import Firebase
import flutter_desktop_sleep

@NSApplicationMain
class AppDelegate: FlutterAppDelegate {
var _windowManager = FlutterDesktopSleepPlugin()
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }
  override func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
  let controller : FlutterViewController = mainFlutterWindow?.contentViewController as! FlutterViewController
  return _windowManager.applicationShouldTerminate(controller);
  }
}

```

## Windows

no need any setup just
