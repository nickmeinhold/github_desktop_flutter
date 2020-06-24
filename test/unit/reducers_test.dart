import 'package:built_collection/built_collection.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_step.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_token.dart';
import 'package:github_desktop_flutter/actions/problems/add_problem.dart';
import 'package:github_desktop_flutter/actions/profile/store_profile.dart';
import 'package:github_desktop_flutter/enums/auth_step.dart';
import 'package:github_desktop_flutter/enums/problem_type.dart';
import 'package:github_desktop_flutter/models/profile/profile.dart';
import 'package:redux/redux.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/redux/reducers.dart';
import 'package:test/test.dart';

void main() {
  group('Reducer', () {
    test('_storeAuthState stores auth state', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store auth state
      store.dispatch(StoreProfile((b) => b
        ..profile.id = 1
        ..profile.login = 'login'
        ..profile.name = 'name'
        ..profile.email = 'email'
        ..profile.avatarUrl = 'url'
        ..profile.location = 'location'));

      // check that the store has the expected value
      expect(store.state.profile.id, equals(1));
      expect(store.state.profile.login, equals('login'));
      expect(store.state.profile.name, equals('name'));
      expect(store.state.profile.email, equals('email'));
      expect(store.state.profile.avatarUrl, equals('url'));
      expect(store.state.profile.location, equals('location'));
    });

    test('_addProblem adds to the list', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to add a problem
      store.dispatch(AddProblem((b) => b
        ..problem.message = 'm'
        ..problem.info = MapBuilder({'a': 'b'})
        ..problem.state.replace(AppState.init())
        ..problem.trace = 'trace'
        ..problem.type = ProblemType.signIn));

      // check that the store has the expected value
      expect(store.state.problems.length, 1);
      final problem = store.state.problems.first;
      expect(problem.message, 'm');
      expect(problem.info, {'a': 'b'});
      expect(problem.state, AppState.init());
      expect(problem.trace, 'trace');
      expect(problem.type, ProblemType.signIn);
    });

    test('_storeAuthStep stores the auth step', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store auth step
      store.dispatch(StoreAuthStep((b) => b..step = AuthStep.waitingForInput));

      // check that the store has the expected value
      expect(store.state.authStep, 1);
    });

    test('_storeAuthToken stores the auth token', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store auth token
      store.dispatch(StoreAuthToken((b) => b..token = 'token'));

      // check that the store has the expected value
      expect(store.state.authToken, 'token');
    });

    test('_storeProfile correctly stores profile', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      final profile = Profile((a) => a
        ..login = 'login'
        ..email = 'email'
        ..id = 1
        ..name = 'name'
        ..avatarUrl = 'url'
        ..location = 'Melbourne');

      // dispatch action to store profile
      store.dispatch(StoreProfile((b) => b..profile.replace(profile)));

      // check that the store has the expected value
      expect(store.state.profile, profile);
    });
  });
}
