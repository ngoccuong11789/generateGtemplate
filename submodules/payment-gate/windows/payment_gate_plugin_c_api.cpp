#include payment_gate_plugin_c_api.h

#include <flutter/plugin_registrar_windows.h>

#include "payment_gate_plugin.h"

void PaymentGatePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  payment_gate::PaymentGatePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
