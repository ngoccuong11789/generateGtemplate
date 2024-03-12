
import 'map_platform_interface.dart';
export 'common_widgets/common_widgets.dart';
export 'constants/constants.dart';
export 'exceptions/exceptions.dart';
export 'features/features.dart';
export 'routing/routing.dart';
export 'utils/utils.dart';
export 'src/models/models.dart';
export 'src/widgets/map.dart';

class Map {
  Future<String?> getPlatformVersion() {
    return MapPlatform.instance.getPlatformVersion();
  }
}
