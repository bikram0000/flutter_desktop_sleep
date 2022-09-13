#include "include/flutter_desktop_sleep/flutter_desktop_sleep_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_desktop_sleep_plugin.h"

void FlutterDesktopSleepPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_desktop_sleep::FlutterDesktopSleepPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
