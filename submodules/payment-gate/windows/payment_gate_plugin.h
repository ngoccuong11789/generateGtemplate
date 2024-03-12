#ifndef FLUTTER_PLUGIN_BOOKING_PLUGIN_H_
#define FLUTTER_PLUGIN_BOOKING_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace payment_gate {

class PaymentGatePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  PaymentGatePlugin();

  virtual ~PaymentGatePlugin();

  // Disallow copy and assign.
  PaymentGatePlugin(const PaymentGatePlugin&) = delete;
  PaymentGatePlugin& operator=(const PaymentGatePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace payment_gate

#endif  // FLUTTER_PLUGIN_BOOKING_PLUGIN_H_
