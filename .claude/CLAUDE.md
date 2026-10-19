# Project instructions for Claude

This is **Anime React** (formerly "Anime Panel") — a Flutter app (Dart, `flutter_riverpod` for state, `dio` for HTTP, `hive`/`hive_flutter` for local storage) for searching and browsing anime/manga reaction panels, copying them to the clipboard, and saving favorites. One codebase ships to both iOS (`ios/`) and Android (`android/`). `firebase_core` is wired in for backend services, but there is no Firebase Hosting or Cloud Functions in this repo.

The real backend is a separate Cloudflare Worker API (`https://anime-panel-api.animepanel.workers.dev` — see `lib/core/constants.dart` and `lib/core/api/anime_panel_api.dart`). Its code and schema live outside this repo, so don't assume you can read or change server-side behavior from here; ask the user or treat it as an external contract.

## Best practices

- Read the relevant screen/widget/provider fully before editing it. Don't guess at structure from filenames.
- Make the smallest change that satisfies the request. Don't refactor, rename, or restructure unrelated code in the same edit.
- Preserve existing formatting, naming conventions, and widget structure already used in the file you're editing.
- Don't undo or simplify prior intentional changes you don't understand — if something looks like a deliberate past decision (specific copy, a specific layout/theme/color choice), ask before reverting it.
- Generated files (`*.freezed.dart`, `*.g.dart`) are produced by `build_runner`. Never hand-edit them — edit the source model/provider (e.g. the `@freezed`/`@riverpod` annotated class) and regenerate with `dart run build_runner build --delete-conflicting-outputs`.
- Run `flutter analyze` after non-trivial Dart changes, and `flutter test` when tests cover the touched code, to confirm things still build and lint clean before reporting done.
- A display-name or branding change (like "Anime Panel" → "Anime React") touches multiple independent places — iOS (`ios/Runner/Info.plist`: `CFBundleDisplayName`/`CFBundleName`), Android (`android/app/src/main/AndroidManifest.xml`: `android:label`), and the in-app `MaterialApp(title: ...)` in `lib/main.dart` — plus any hardcoded copy (e.g. `lib/features/keyboard_setup/keyboard_setup_screen.dart`). Check all of them, not just one platform.
- Never change the bundle identifier (`com.taliaferrotech.animepanel` in `ios/animepanel.xcodeproj` / `android/app/build.gradle.kts`) or Xcode target/product names — that effectively creates a new app listing and breaks existing installs/updates. That's a much bigger decision than a display-name change and needs explicit, separate confirmation.
- Never run a release build, code-sign, or submit to TestFlight/App Store Connect/Play Console (`flutter build ipa`, `flutter build appbundle --release`, `fastlane`, any store upload) — the user does these themselves. Debug builds and `flutter run` for local testing are fine.
- Never bump the app version/build number (`pubspec.yaml` `version:`, which drives both `FLUTTER_BUILD_NAME`/`FLUTTER_BUILD_NUMBER` on iOS and `versionCode`/`versionName` on Android) unless the user explicitly asks.
- Never commit, push, or deploy anything (including to the Worker backend, if it's ever added to this repo) unless the user explicitly asks. The user does these themselves.

## Change log requirement

After **every code change** (not just at the end of a session), append an entry to [history.md](history.md) in this folder. Use this template:

```markdown
## YYYY-MM-DD HH:MM
**Files:** path/one.dart, path/two.dart
**Change:** One or two sentences describing what changed and why.
**Verify:** How to confirm it worked (e.g. "run `flutter analyze`, check the Home screen app bar shows the new title").
```

- Add the newest entry at the **top** of `history.md`, just under the title.
- Keep entries factual and specific — name the actual files touched, not "various files."
- This log exists so we can trace what changed and why across sessions, since past changes have been unintentionally undone before.

## In-chat reporting requirement

After making any code change, always reply in chat with three parts:

1. **Summary** — what changed, in plain language.
2. **How to verify** — concrete steps to confirm it works (command to run, screen/section to check, what it should look like).
3. **Action items** — anything the user needs to do themselves (e.g. review content, approve a design choice, build/submit to a store, update an env var). If there are none, say "None."
