# flutter news

Flutter app that displays news content from NewsAPI for Android and iOS.

## Dependencies
### Runtime
- flutter (SDK, Dart ^3.10.3): core Flutter framework
- cupertino_icons ^1.0.8: iOS-style icon set
- flutter_dotenv ^6.0.0: load `.env.<flavor>` files via `EnvLoader` to populate `FlavorConfig`
- flutter_bloc ^9.1.1: state management for presentation layer
- equatable ^2.0.7: value equality for entities such as `Article`
- dio ^5.9.0: HTTP client for NewsAPI calls
- retrofit ^4.9.1: typed REST client built on Dio (`lib/data/sources/news_api.dart`)
- json_annotation ^4.9.0: annotations for JSON models like `ArticleDto`
- go_router ^17.0.1: declarative navigation
- get_it ^9.2.0: service locator / dependency injection

### Dev / tooling
- flutter_test (SDK): Flutter testing utilities
- flutter_lints ^6.0.0: lint rules
- analyzer 8.4.1: pinned analyzer version (dependency override)
- build_runner ^2.10.4: runs code generation tasks
- retrofit_generator ^10.2.0: generates Retrofit clients from annotated APIs
- json_serializable ^6.11.3: generates JSON serializers for DTOs

## Prerequisites
- Flutter SDK installed and available in PATH
- NewsAPI key configured in environment files (`assets/env/.env.dev`, `.env.staging`, `.env.prod`).

## Setup & usage
- Install dependencies: `flutter pub get`
- Configure environment variables:
  - Update `APP_NAME`, `NEWS_API_BASE_URL`, and `NEWS_API_KEY` in `assets/env/.env.dev`, `assets/env/.env.staging`, and `assets/env/.env.prod` (use `assets/env/.env.dist` as a template).
  - `EnvLoader` loads the matching file based on the entrypoint (`main_dev.dart`, `main_staging.dart`, or `main_prod.dart`), and `FlavorConfig` exposes the values.
- Generate Retrofit and JSON code (needed after DTO/API changes):  
  `flutter pub run build_runner build --delete-conflicting-outputs`
- Run the app per flavor:
  - Dev: `flutter run -t lib/main_dev.dart`
  - Staging: `flutter run -t lib/main_staging.dart`
  - Prod: `flutter run -t lib/main_prod.dart`

## Running on emulator / simulator
- Android
  - List emulators: `flutter emulators`
  - Start an emulator: `flutter emulators --launch <emulator_id>`
  - Verify devices: `flutter devices`
  - Run the app: `flutter run -d <device_id>`
- iOS (macOS)
  - Start simulator: `open -a Simulator`
  - Verify devices: `flutter devices`
  - Run the app: `flutter run -d ios` or `flutter run -d <simulator_id>`

## ADB helpers
- Restart adb: `adb kill-server && adb start-server`
- Kill adb only: `adb kill-server`
- Check connected devices: `adb devices`

## Troubleshooting
- If the emulator is not detected, restart adb and rerun `flutter devices`.
- Ensure Android emulators (AVD) are installed; for iOS, Xcode and Command Line Tools must be available.

## Build App
- Dev: `flutter build appbundle --release --flavor dev -t lib/main_dev.dart`
- Staging: `flutter build appbundle --release --flavor staging -t lib/main_staging.dart`
- Prod: `flutter build appbundle --release --flavor prod -t lib/main_prod.dart`

## Release (Prod environment)
- Prepare the keystore (one-time setup):
  - From the project root, run: `cd android`
  - Generate keystore: `keytool -genkey -v -keystore app/release-keystore.jks -alias release-key -keyalg RSA -keysize 2048 -storetype JKS -validity 10000 `
  - Copy `android/key.properties.dist` to `android/key.properties`, then adjust the configuration:
    ```
    storePassword=<password_keystore>
    keyPassword=<password_keystore>
    ```
- Ensure `key.properties` is not committed (check `.gitignore`).
- Build bundle release: `flutter build appbundle --release --flavor prod -t lib/main_prod.dart`
- Optional: Build APK per ABI (if needed): `flutter build apk --release --flavor prod --split-per-abi -t lib/main_prod.dart`
- Find the build outputs in `build/app/outputs/bundle/release` or `build/app/outputs/flutter-apk`.
