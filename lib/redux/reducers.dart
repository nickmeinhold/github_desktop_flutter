import 'package:github_desktop_flutter/actions/auth/store_auth_step.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_token.dart';
import 'package:github_desktop_flutter/actions/problems/add_problem.dart';
import 'package:github_desktop_flutter/actions/profile/store_profile.dart';
import 'package:redux/redux.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, AddProblem>(_addProblem),
  TypedReducer<AppState, StoreAuthStep>(_storeAuthStep),
  TypedReducer<AppState, StoreAuthToken>(_storeAuthToken),
  TypedReducer<AppState, StoreProfile>(_storeProfile),
  // ...userReducers,
]);

AppState _addProblem(AppState state, AddProblem action) {
  return state.rebuild((b) => b..problems.add(action.problem));
}

AppState _storeAuthStep(AppState state, StoreAuthStep action) {
  return state.rebuild((b) => b..authStep = action.step);
}

AppState _storeAuthToken(AppState state, StoreAuthToken action) {
  return state.rebuild((b) => b..authToken = action.token);
}

AppState _storeProfile(AppState state, StoreProfile action) {
  return state.rebuild((b) => b..profile.replace(action.profile));
}
