# ECOAlert

Cross-platform mobile app built with [Flutter] and [Firebase].

## Notes

- [go_router] (with [go_router_builder]) is used for navigation

## Development

### Run dependencies update

```console
flutter pub get
```

### Run linter

```console
flutter analyze
dart run custom_lint
```

### Run unit tests

```console
flutter test
```

### Run end-to-end UI tests

Make sure you have [Maestro](https://maestro.mobile.dev) installed. Then:

```console
maestro test ./maestro/<test_name>.yaml
```

### Run formatter

```console
dart format .
```

### Regenerate code

```console
dart run build_runner build --delete-conflicting-outputs
```

## Deployment

To build debug app for Android:

```console
flutter build apk --debug
```

To build debug app for iOS

```console
flutter build ios --debug
```

[Flutter]: https://flutter.dev
[Firebase]: https://firebase.google.com
[go_router]: https://pub.dev/packages/go_router
[go_router_builder]: https://pub.dev/packages/go_router_builder
