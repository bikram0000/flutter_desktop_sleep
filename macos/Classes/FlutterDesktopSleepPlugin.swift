import Cocoa
import FlutterMacOS

public class FlutterDesktopSleepPlugin: NSObject, FlutterPlugin {
    var methodChannel: FlutterMethodChannel?
  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = FlutterDesktopSleepPlugin()
    let channel = FlutterMethodChannel(name: "flutter_desktop_sleep", binaryMessenger: registrar.messenger)
    instance.methodChannel=channel;
    instance.applicationDidFinishLaunching2()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }



    public func applicationDidFinishLaunching2() {

          NSWorkspace.shared.notificationCenter.addObserver(self, selector: #selector(sleepListener(_:)),
                                                            name: NSWorkspace.willSleepNotification, object: nil)
          NSWorkspace.shared.notificationCenter.addObserver(self, selector: #selector(sleepListener(_:)),
                                                            name: NSWorkspace.didWakeNotification, object: nil)

      }

      @objc public func sleepListener(_ aNotification: Notification) {

          if aNotification.name == NSWorkspace.willSleepNotification {
              methodChannel?.invokeMethod("onWindowsSleep", arguments: "sleep")
              NSLog("Going to sleep")
          } else if aNotification.name == NSWorkspace.didWakeNotification {
               methodChannel?.invokeMethod("onWindowsSleep", arguments: "woke_up")
              NSLog("Woke up")
          } else {
              NSLog("Some other event other than the first two")
          }
      }

}
