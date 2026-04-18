# App Icon Setup

The AnimePanelLogo.png is configured as the app launcher icon for both iOS and Android.

## Generate App Icons

To generate the app launcher icons, run:

```bash
flutter pub get
dart run flutter_launcher_icons
```

This will automatically:
- Create iOS app icons in `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
- Create Android app icons in `android/app/src/main/res/mipmap-*/`
- Use a black background for Android's adaptive icon

## Configuration

The icon configuration is in `pubspec.yaml`:

```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/images/AnimePanelLogo.png"
  adaptive_icon_background: "#000000"
  adaptive_icon_foreground: "assets/images/AnimePanelLogo.png"
```

After generating the icons, rebuild your app to see the new launcher icon on your device.
