import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github/github.dart';
import 'package:github_desktop_flutter/actions/auth/observe_auth_state.dart';
import 'package:github_desktop_flutter/middleware/middleware.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/models/profile/profile.dart';
import 'package:github_desktop_flutter/reducers/reducers.dart';
import 'package:github_desktop_flutter/services/github_service.dart';
import 'package:github_desktop_flutter/services/platform_service.dart';
import 'package:github_desktop_flutter/widgets/auth_page.dart';
import 'package:github_desktop_flutter/widgets/main_page.dart';
import 'package:redux/redux.dart';

class GDFApp extends StatefulWidget {
  GDFApp({this.injectedStore});
  final Store<AppState> injectedStore;
  @override
  _GDFAppState createState() => _GDFAppState();
}

class _GDFAppState extends State<GDFApp> {
  Store<AppState> store;

  @override
  void initState() {
    super.initState();

    // use the injected store or create a new one
    store = widget.injectedStore ??
        Store<AppState>(
          appReducer,
          initialState: AppState.init(),
          middleware: [
            ...createMiddleware(
              PlatformService(),
              GitHubService(Dio(), GitHub()),
            ),
          ],
        );

    store.dispatch(ObserveAuthState());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, Profile>(
          distinct: true,
          converter: (store) => store.state.profile,
          builder: (context, profile) {
            return (profile == null || profile.id == null)
                ? AuthPage()
                : MainPage();
          },
        ),
      ),
    );
  }
}
