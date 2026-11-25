# Space App

A Flutter app for exploring the solar system.

## Run

```bash
flutter pub get
flutter run
```

Supports Android and iOS. The 3D viewer uses Flutter GPU, enabled in the Android manifest and the iOS Info.plist.

## Structure

- `lib/core` — theme, layout, assets, formatters, shared widgets.
- `lib/data` — planet model and datasheet values.
- `lib/features` — home, planet picker, and planet detail screens.
- `assets/images` — planet artwork.
- `assets/models` — GLB models for the 3D viewer.
- `assets/fonts` — Space Grotesk (SIL Open Font License).
