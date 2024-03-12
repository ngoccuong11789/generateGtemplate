# Soctrip Icon module

### How to use

- Add soctrip_icons package to `pubspec.yaml` dependencies
    - In the case of main/master-app
    ```yaml
    dependencies:
      soctrip_icons:
        path: submodules/soctrip-icon
    ```
    - In the case of submodule
    ```yaml
    dependencies:
      soctrip_icons:
        path: ../soctrip-icon
    ```
- Import
```dart
import 'package:soctrip_icons/soctrip_icons.dart' as soctrip;
```
- Use icon as a widget
```dart
const alertCircleIcon = soctrip.SoctripIcon(soctrip.Icons.alertCircle);
```
- Use icon as a span
```dart
final alertCircleIconSpan = soctrip.SoctripIconSpan(soctrip.Icons.alertCircle);
```


### How to update icons

- Download the new package version from https://private-npm.tma-swerp.com/-/web/detail/@soctrip-common/icon
- Extract to folder `tools/soctrip-icon-generator/src/src-font/soctrip-icon-v1.0`
- cd to folder `tools/soctrip-icon-generator/`
- Run the tool
```bash
./gradlew run
```
- Commit and push new code.

