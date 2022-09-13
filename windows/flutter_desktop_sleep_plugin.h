#ifndef FLUTTER_PLUGIN_FLUTTER_DESKTOP_SLEEP_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_DESKTOP_SLEEP_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_desktop_sleep {

class FlutterDesktopSleepPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterDesktopSleepPlugin();

  virtual ~FlutterDesktopSleepPlugin();

  // Disallow copy and assign.
  FlutterDesktopSleepPlugin(const FlutterDesktopSleepPlugin&) = delete;
  FlutterDesktopSleepPlugin& operator=(const FlutterDesktopSleepPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_desktop_sleep

#endif  // FLUTTER_PLUGIN_FLUTTER_DESKTOP_SLEEP_PLUGIN_H_
