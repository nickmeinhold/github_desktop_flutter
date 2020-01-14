# github_desktop_flutter

A Github Desktop inspired app for MacOS, made with Flutter.

State Management 
- redux.dart 
- flutter_redux 

Auth 
- firebase_auth 
- custom github auth 

## Code gen for built_value 

After making changes to built_value classes run the builder to generate the new code:

```
flutter pub run build_runner build
```

## Running 

Run on port 5000, as localhost:5000 is [whitelisted for Google authentication](https://github.com/FirebaseExtended/flutterfire/tree/master/packages/firebase_auth/firebase_auth/example):

```Dart
flutter run -d web-server --web-port 5000
flutter run -d chrome --web-port 5000
```

### Issues 

#### Firebase Auth 

When running locally, the firebase configuration won't work as it is using reserved hosting URLs. 

Using CDNs as in `web/index_ddc.html` will work. 
- note: this file is not checked in to the repo

#### Google Sign in 

When launching from VS Code debug, attempting to sign in produces:

```
“Browser or app may not be secure. Try using a different browser.”
```

Probably due to running chrome with remote debugging, see [this SO question](https://stackoverflow.com/questions/59480956/browser-or-app-may-not-be-secure-try-using-a-different-browser-error-with-fl)

Either run without debugging: 

```Dart
flutter run -d web-server --web-port 5000
```

Or use `AltAuthService` in place of `AuthService`, which emits a user from the stream of auth state and avoids the need to sign in.

## Building 

``` 
flutter build web 
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
    "site": "silicon-beach-admin",
    "public": "public",
    ...
  }
}
```

### Deploy 

```Dart
firebase deploy --only hosting:silicon-beach-admin
```

After deploying, view at `https://silicon-beach-admin.web.app/`

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
