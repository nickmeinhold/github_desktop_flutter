# github_desktop_flutter

A Github Desktop inspired app for MacOS, made with Flutter.

- State Management: [redux.dart, flutter_redux] 
- Auth: [custom github auth: [flutter web app, cloud functions]]

## Common commands 

### use built_value codegen

```
flutter pub run build_runner watch --delete-conflicting-outputs
```

### run & connect to the rdt server

```
remotedev --port 8000
http://localhost:8000/
```

### build/deploy web app 

```sh
flutter build web -t lib/main_web.dart
firebase deploy --only hosting:flutter-github-desktop
```

### deploy cloud functions

```sh
firebase deploy --only functions
```

## Running the web app 

Run on port 5000, as localhost:5000 is [whitelisted for Google authentication](https://github.com/FirebaseExtended/flutterfire/tree/master/packages/firebase_auth/firebase_auth/example):

```sh
flutter run -t lib/main_web.dart -d web-server --web-port 5000
flutter run -t lib/main_web.dart -d chrome --web-port 5000
```

## Tests 

### Unit and Widget Tests 

```
flutter test
```

### Integration Tests 

```
flutter drive --target=test_driver/app.dart
```
