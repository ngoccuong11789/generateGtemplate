#ifndef FLUTTER_PLUGIN_BOOKING_PLUGIN_H_
#define FLUTTER_PLUGIN_BOOKING_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace map {

class MapPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  MapPlugin();

  virtual ~MapPlugin();

  // Disallow copy and assign.
  MapPlugin(const MapPlugin&) = delete;
  MapPlugin& operator=(const MapPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace Map

#endif  // FLUTTER_PLUGIN_BOOKING_PLUGIN_H_
