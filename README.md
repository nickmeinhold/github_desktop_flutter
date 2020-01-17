# github_desktop_flutter

A Github Desktop inspired app for MacOS, made with Flutter.

- State Management: [redux.dart, flutter_redux] 
- Auth: [custom github auth: [flutter web app, cloud functions]]

## Common commands 

built_value 

```
flutter pub run build_runner build
```

web app 

``` 
flutter build web -t lib/main_web.dart
cd build/web
firebase deploy --only hosting:flutter-github-desktop
```

firebase functions

```
cd functions
pub run build_runner build --output=build
firebase deploy --only functions
```

## Running the web app 

Run on port 5000, as localhost:5000 is [whitelisted for Google authentication](https://github.com/FirebaseExtended/flutterfire/tree/master/packages/firebase_auth/firebase_auth/example):

```
flutter run -t lib/main_web.dart -d web-server --web-port 5000
flutter run -t lib/main_web.dart -d chrome --web-port 5000
```

### Issues 

#### Firebase Auth 

When running locally, the firebase configuration won't work as it is using reserved hosting URLs. 

Using CDNs as in `web/index_ddc.html` will work. 
- note: this file is not checked in to the repo

## Building 

``` 
flutter build web -t lib/main_web.dart
```

## Deploying 

### Setup 

First make sure you are signed in:

```
firebase login
```

From `build/web` run:

```
firebase init
```

- What do you want to use as your public directory? 
  - `.`
- Configure as a single-page app? 
  - `Yes` 
- File ./index.html already exists. Overwrite? 
  - `No`

Specify your site in firebase.json
- Add your site name to the firebase.json configuration file.

```Json
{
  "hosting": {
    "site": "flutter-github-desktop",
    "public": "public",
    ...
  }
}
```

### Deploy 

```Dart
firebase deploy --only hosting:flutter-github-desktop
```

## Firebase functions 

see [Firebase Functions Interop Library for Dart](https://github.com/pulyaevskiy/firebase-functions-interop) for setup instructions 

### Extra setup 

- exclude the build dir from being analyzed and creating problems in VS Code 
  - add `analysis_options.yaml` to `functions/` with the following: 

```
analyzer:
  exclude: 
    - build/**
```

```
cd functions
pub run build_runner build --output=build
firebase deploy --only functions
```

After deploying, view at `https://flutter-github-desktop.web.app/`

## Code gen for built_value 

After making changes to built_value classes run the builder to generate the new code:

```
flutter pub run build_runner build
```

## Redux RemoteDevTools (RDT) 

- find the IP address of the computer 
- use one of the strings in `utilities/mock.dart` or make a new one 
- edit `main.dart` to use the correct IP 
- run the remotedev server

```
remotedev --port 8000
```

- open a web page with url:

```
http://localhost:8000/
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
