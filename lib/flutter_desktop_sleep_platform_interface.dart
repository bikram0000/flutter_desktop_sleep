import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_desktop_sleep_method_channel.dart';

abstract class FlutterDesktopSleepPlatform extends PlatformInterface {
  /// Constructs a FlutterDesktopSleepPlatform.
  FlutterDesktopSleepPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterDesktopSleepPlatform _instance =
      MethodChannelFlutterDesktopSleep();

  /// The default instance of [FlutterDesktopSleepPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterDesktopSleep].
  static FlutterDesktopSleepPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterDesktopSleepPlatform] when
  /// they register themselves.
  static set instance(FlutterDesktopSleepPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void setWindowSleepHandler(Future<void> Function(String?)? handler) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
