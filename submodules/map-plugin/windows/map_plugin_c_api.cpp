#include "include/map/map_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "map_plugin.h"

void MapPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  map::MapPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
