import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_desktop_sleep/flutter_desktop_sleep.dart';
import 'package:flutter_desktop_sleep/flutter_desktop_sleep_platform_interface.dart';
import 'package:flutter_desktop_sleep/flutter_desktop_sleep_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterDesktopSleepPlatform
    with MockPlatformInterfaceMixin
    implements FlutterDesktopSleepPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  void setWindowSleepHandler(Future<void> Function(String? p1)? handler) {
    // TODO: implement setWindowSleepHandler
  }
}

void main() {
  final FlutterDesktopSleepPlatform initialPlatform =
      FlutterDesktopSleepPlatform.instance;

  test('$MethodChannelFlutterDesktopSleep is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterDesktopSleep>());
  });

  test('getPlatformVersion', () async {
    FlutterDesktopSleep flutterDesktopSleepPlugin = FlutterDesktopSleep();
    MockFlutterDesktopSleepPlatform fakePlatform =
        MockFlutterDesktopSleepPlatform();
    FlutterDesktopSleepPlatform.instance = fakePlatform;

    expect(await flutterDesktopSleepPlugin.getPlatformVersion(), '42');
  });
}
