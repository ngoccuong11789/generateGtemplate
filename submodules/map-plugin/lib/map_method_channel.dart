import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'map_platform_interface.dart';

/// An implementation of [MapPlatform] that uses method channels.
class MethodChannelMap extends MapPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('map');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
