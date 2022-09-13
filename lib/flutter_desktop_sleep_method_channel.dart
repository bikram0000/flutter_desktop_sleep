import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_desktop_sleep_platform_interface.dart';

/// An implementation of [FlutterDesktopSleepPlatform] that uses method channels.
class MethodChannelFlutterDesktopSleep extends FlutterDesktopSleepPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_desktop_sleep');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  void setWindowSleepHandler(Future<void> Function(String?)? handler) {
    methodChannel.setMethodCallHandler((call) async {
       if (call.method == 'onWindowsSleep') {
        // Note: the 'destroyWindow' method just close the window without
        // any confirming.
        if (handler != null) {
          await handler(call.arguments);
        }
      }
      return null;
    });
  }
}
