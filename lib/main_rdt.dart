import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:github_desktop_flutter/reducers/reducers.dart';
import 'package:github_desktop_flutter/services/auth_service.dart';
import 'package:github_desktop_flutter/services/github_service.dart';
import 'package:github_desktop_flutter/services/platform_service.dart';
import 'package:github_desktop_flutter/util/github_oauth_credentials.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:github_desktop_flutter/middleware/middleware.dart';
import 'package:github_desktop_flutter/widgets/app.dart';

import 'models/app/app_state.dart';

void main() async {
  final remoteDevtools = RemoteDevToolsMiddleware('localhost:8000');

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: [
      remoteDevtools,
      ...createMiddleware(
        PlatformService(),
        AuthService(githubClientId, githubClientSecret, githubScopes),
        GitHubService(Dio(), GitHub()),
      ),
    ],
  );

  remoteDevtools.store = store;

  try {
    await remoteDevtools.connect();
  } on Exception catch (e) {
    print(e);
  }

  runApp(GDFApp(injectedStore: store));
}
