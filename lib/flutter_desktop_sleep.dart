import 'flutter_desktop_sleep_platform_interface.dart';

class FlutterDesktopSleep {
  Future<String?> getPlatformVersion() {
    return FlutterDesktopSleepPlatform.instance.getPlatformVersion();
  }

  Future<void> terminateApp() {
    return FlutterDesktopSleepPlatform.instance.terminateApp();
  }

  void setWindowSleepHandler(Future<void> Function(String?)? handler) {
    FlutterDesktopSleepPlatform.instance.setWindowSleepHandler(handler);
  }
}
