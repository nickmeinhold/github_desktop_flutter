import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:github_desktop_flutter/services/github_service.dart';
import 'package:github_desktop_flutter/services/platform_service.dart';
import 'package:redux/redux.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:github_desktop_flutter/redux/middleware.dart';
import 'package:github_desktop_flutter/redux/reducers.dart';
import 'package:github_desktop_flutter/util/mocks.dart';
import 'package:github_desktop_flutter/widgets/app.dart';

import 'models/app_state.dart';

void main() async {
  final remoteDevtools = RemoteDevToolsMiddleware(imac22);

  final store = Store<AppState>(
    appReducer,
    initialState: AppState.init(),
    middleware: [
      remoteDevtools,
      ...createMiddleware(
        PlatformService(),
        GitHubService(Dio()),
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
