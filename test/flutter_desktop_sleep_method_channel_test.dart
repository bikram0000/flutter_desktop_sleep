import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_desktop_sleep/flutter_desktop_sleep_method_channel.dart';

void main() {
  MethodChannelFlutterDesktopSleep platform = MethodChannelFlutterDesktopSleep();
  const MethodChannel channel = MethodChannel('flutter_desktop_sleep');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
