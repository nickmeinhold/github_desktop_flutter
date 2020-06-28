import 'package:github_desktop_flutter/actions/auth/check_auth_state.dart';
import 'package:github_desktop_flutter/actions/auth/authenticate.dart';
import 'package:github_desktop_flutter/actions/auth/sign_out.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_step.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_token.dart';
import 'package:github_desktop_flutter/actions/problems/add_problem.dart';
import 'package:github_desktop_flutter/actions/profile/store_profile.dart';
import 'package:github_desktop_flutter/enums/auth_step.dart';
import 'package:github_desktop_flutter/enums/problem_type.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/services/auth_service.dart';
import 'package:github_desktop_flutter/services/github_service.dart';
import 'package:github_desktop_flutter/services/platform_service.dart';
import 'package:redux/redux.dart';

typedef AuthenticationMiddleware = void Function(
    Store<AppState> store, Authenticate action, NextDispatcher next);
typedef CheckAuthStateMiddleware = void Function(
    Store<AppState> store, CheckAuthState action, NextDispatcher next);
typedef SignOutMiddleware = void Function(
    Store<AppState> store, SignOut action, NextDispatcher next);

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createMiddleware(PlatformService platformService,
    AuthService authService, GitHubService gitHubService) {
  return [
    TypedMiddleware<AppState, CheckAuthState>(
      _checkAuthState(platformService, gitHubService),
    ),
    TypedMiddleware<AppState, Authenticate>(
      _authenticate(platformService, authService, gitHubService),
    ),
    TypedMiddleware<AppState, SignOut>(
      _signOut(platformService),
    ),
    // TypedMiddleware<AppState, StoreAuthToken>(
    //   _storeTokenAndRetrieveProfile(platformService, githubService),
    // ),
  ];
}

CheckAuthStateMiddleware _checkAuthState(
        PlatformService platformService, GitHubService gitHubService) =>
    (store, action, next) async {
      next(action);

      try {
        final token = await platformService.retrieveToken();
        if (token != null) {
          // add the token to the store
          store.dispatch(StoreAuthToken((b) => b..token = token));
          // retrieve the profile with the token
          final profile = await gitHubService.retrieveProfile(token);
          // add the profile to the store (which also triggers an app-level
          // rebuild with home page in place of auth page)
          store.dispatch(StoreProfile((b) => b..profile.replace(profile)));
          // lastly, reset the auth step for when/if the user navigates back
          store.dispatch(
              StoreAuthStep((b) => b..step = AuthStep.waitingForInput));
        } else {
          store.dispatch(
              StoreAuthStep((b) => b..step = AuthStep.waitingForInput));
        }
      } catch (error, trace) {
        store.dispatch(AddProblem.from(
            message: error.toString(),
            type: ProblemType.checkAuthState,
            traceString: trace.toString()));
      }
    };

AuthenticationMiddleware _authenticate(PlatformService platformService,
        AuthService authService, GitHubService githubService) =>
    (store, action, next) async {
      next(action);

      try {
        final token = await authService.getAuthToken();

        await platformService.store(token: token);

        store.dispatch(StoreAuthToken((b) => b..token = token));
        store
            .dispatch(StoreAuthStep((b) => b..step = AuthStep.waitingForInput));

        // retrive and store the profile
        final profile = await githubService.retrieveProfile(token);
        store.dispatch(StoreProfile((b) => b..profile.replace(profile)));
      } catch (error, trace) {
        store.dispatch(AddProblem.from(
            message: error.toString(),
            type: ProblemType.authenticate,
            traceString: trace.toString()));
      }
    };

SignOutMiddleware _signOut(PlatformService platformService) =>
    (store, action, next) async {
      next(action);

      try {
        // save null to shared_preferences
        await platformService.store(token: null);
      } on Exception catch (error, trace) {
        store.dispatch(AddProblem.from(
          message: error.toString(),
          type: ProblemType.signOut,
          traceString: trace.toString(),
        ));
      }
    };

// typedef StoreAuthTokenMiddleware = void Function(
//     Store<AppState> store, StoreAuthToken action, NextDispatcher next);

// StoreAuthTokenMiddleware _storeTokenAndRetrieveProfile(
//     PlatformService platformService, GitHubService githubService) {
//   return (store, action, next) async {
//     next(action);

//     try {
//       // save the token to shared_preferences
//       await platformService.store(token: store.state.authToken);

//       // retrieve and store profile
//       final profile =
//           await githubService.retrieveProfile(store.state.authToken);
//       store.dispatch(StoreProfile((b) => b..profile.replace(profile)));
//     } on Exception catch (error, trace) {
//       store.dispatch(AddProblem.from(
//         message: error.toString(),
//         type: ProblemType.signIn,
//         traceString: trace.toString(),
//       ));
//     }
//   };
// }
