# Change History

## 2026-10-18 20:45
**Files:** ios/Runner/Info.plist, android/app/src/main/AndroidManifest.xml, lib/main.dart, lib/features/keyboard_setup/keyboard_setup_screen.dart
**Change:** Renamed the app's display name from "Anime Panel" to "Anime React" everywhere it's user-facing — iOS `CFBundleDisplayName`/`CFBundleName`, Android `android:label`, the Flutter `MaterialApp` title, and the keyboard-setup instructions that tell the user which keyboard name to look for in iOS Settings. Bundle identifier (`com.taliaferrotech.animepanel`), Xcode target/product names, and internal class names (`AnimePanelApi`, etc.) were intentionally left unchanged.
**Verify:** `flutter run` on iOS/Android and confirm the home-screen icon label and in-app title read "Anime React"; open the keyboard setup screen and confirm the instructions say "Anime React". Store listing names (App Store Connect / Play Console) still need to be updated manually — not controlled by this repo.
