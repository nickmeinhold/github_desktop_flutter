import 'package:github_desktop_flutter/models/actions.dart';
import 'package:github_desktop_flutter/models/problem.dart';
import 'package:github_desktop_flutter/models/profile.dart';
import 'package:github_desktop_flutter/services/github_service.dart';
import 'package:github_desktop_flutter/services/platform_service.dart';
import 'package:redux/redux.dart';
import 'package:github_desktop_flutter/models/app_state.dart';

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createMiddleware(
    PlatformService platformService, GitHubService githubService) {
  return [
    TypedMiddleware<AppState, StoreAuthToken>(
      _storeTokenAndRetrieveProfile(platformService, githubService),
    ),
    TypedMiddleware<AppState, LaunchAuthPage>(
      _launchAuthPage(platformService),
    ),
    TypedMiddleware<AppState, CheckForAuthToken>(
      _checkForAuthToken(platformService),
    ),
  ];
}

void Function(Store<AppState> store, StoreAuthToken action, NextDispatcher next)
    _storeTokenAndRetrieveProfile(
        PlatformService platformService, GitHubService githubService) {
  return (Store<AppState> store, StoreAuthToken action,
      NextDispatcher next) async {
    next(action);

    try {
      // save the token to shared_preferences
      await platformService.store(token: store.state.authToken);

      // retrieve and store profile
      Profile profile =
          await githubService.retrieveProfile(store.state.authToken);
      store.dispatch(StoreProfile(profile: profile));
    } on Exception catch (error, trace) {
      store.dispatch(AddProblem(
        problem: Problem((b) => b
          ..type = ProblemTypeEnum.signin
          ..message = error.toString()
          ..trace = trace.toString()),
      ));
    }
  };
}

void Function(Store<AppState> store, LaunchAuthPage action, NextDispatcher next)
    _launchAuthPage(PlatformService platformService) {
  return (Store<AppState> store, LaunchAuthPage action,
      NextDispatcher next) async {
    next(action);

    final url = 'https://github.com/login/oauth/authorize' +
        '?client_id=987bd965a05598c5e090' +
        '&scope=public_repo%20read:user%20user:email';

    try {
      platformService.launch(url: url);
    } catch (error, trace) {
      store.dispatch(AddProblem(
        problem: Problem((b) => b
          ..type = ProblemTypeEnum.signin
          ..message = error.toString()
          ..trace = trace.toString()),
      ));
    }
  };
}

void Function(
        Store<AppState> store, CheckForAuthToken action, NextDispatcher next)
    _checkForAuthToken(PlatformService platformService) {
  return (Store<AppState> store, CheckForAuthToken action,
      NextDispatcher next) async {
    next(action);

    try {
      final token = await platformService.retrieveToken();
      if (token != null) {
        store.dispatch(StoreAuthToken(token: token));
      } else {
        store.dispatch(StoreAuthStep(step: 1));
      }
    } catch (error, trace) {
      store.dispatch(AddProblem(
        problem: Problem((b) => b
          ..type = ProblemTypeEnum.signin
          ..message = error.toString()
          ..trace = trace.toString()),
      ));
    }
  };
}
