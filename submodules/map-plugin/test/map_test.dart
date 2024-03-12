import 'package:flutter_test/flutter_test.dart';
import 'package:map/map.dart';
import 'package:map/map_platform_interface.dart';
import 'package:map/map_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMapPlatform
    with MockPlatformInterfaceMixin
    implements MapPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MapPlatform initialPlatform = MapPlatform.instance;

  test('$MethodChannelMap is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMap>());
  });

  test('getPlatformVersion', () async {
    Map mapPlugin = Map();
    MockMapPlatform fakePlatform = MockMapPlatform();
    MapPlatform.instance = fakePlatform;

    expect(await mapPlugin.getPlatformVersion(), '42');
  });
}
