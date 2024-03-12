import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'map_method_channel.dart';

abstract class MapPlatform extends PlatformInterface {
  /// Constructs a MapPlatform.
  MapPlatform() : super(token: _token);

  static final Object _token = Object();

  static MapPlatform _instance = MethodChannelMap();

  /// The default instance of [MapPlatform] to use.
  ///
  /// Defaults to [MethodChannelMap].
  static MapPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MapPlatform] when
  /// they register themselves.
  static set instance(MapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
