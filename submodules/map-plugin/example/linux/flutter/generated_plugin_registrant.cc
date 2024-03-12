//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <map/map_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) map_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "MapPlugin");
  map_plugin_register_with_registrar(map_registrar);
}
