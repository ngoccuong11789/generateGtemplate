# Super App Boilerplate

A boilerplate/starter project for quickly building Super App using Flutter.

## Manual Installation

If you would still prefer to do the installation manually, follow these steps:

Clone the repo:

```bash
git clone https://gitlab.tma.com.vn/soctrip-development/template-mobile/master-app.git
```

Install the dependencies:

```bash
flutter clean
flutter pub get
```

## Table of Contents
- [Commands](#commands)
- [Project Structure](#project-structure)
- [Codegen](#codegen)
## Commands

Running locally:

```bash
flutter clean
flutter pub get
```

## Project Structure

```
src\
 |--common_widgets\         # Contain all common widgets used in the app
 |--constants\    # 
 |--exceptions\           # The app has a centralized error handling mechanism.
 |--features\    # The core concept is to have folders as per the features in the application which ensures that the screens, widgets, controllers, services for that particular feature are all contained within a single folder.
 |--infrastructure\         # Generate API from backend
 |--localization\         # Navigation and routing
 |--routing\       # Navigation and routing
 |--utils\          # Utility classes and functions
```

## Codegen

```
rm -rf generated
mkdir "generated"

docker-compose up dartApiCodegen

cd generated
flutter pub get
flutter pub upgrade
flutter pub run build_runner build --delete-conflicting-outputs
```

## License

[MIT](LICENSE)