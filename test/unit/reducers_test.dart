import 'package:github_desktop_flutter/models/profile.dart';
import 'package:redux/redux.dart';
import 'package:github_desktop_flutter/models/actions.dart';
import 'package:github_desktop_flutter/models/app_state.dart';
import 'package:github_desktop_flutter/models/problem.dart';
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
      store.dispatch(Action.StoreProfile(
          profile: Profile((b) => b
            ..id = 1
            ..login = 'login'
            ..name = 'name'
            ..email = 'email'
            ..avatarUrl = 'url'
            ..location = 'location')));

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
      store.dispatch(Action.AddProblem(
          problem: Problem((b) => b
            ..message = 'm'
            ..info = {'a': 'b'}
            ..state.replace(AppState.init())
            ..trace = 'trace'
            ..type = ProblemTypeEnum.signin)));

      // check that the store has the expected value
      expect(store.state.problems.length, 1);
      final problem = store.state.problems.first;
      expect(problem.message, 'm');
      expect(problem.info, {'a': 'b'});
      expect(problem.state, AppState.init());
      expect(problem.trace, 'trace');
      expect(problem.type, ProblemTypeEnum.signin);
    });

    test('_storeAuthStep stores the auth step', () {
      // create a basic store with the app reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // dispatch action to store auth step
      store.dispatch(Action.StoreAuthStep(step: 1));

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
      store.dispatch(Action.StoreAuthToken(token: 'token'));

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
      store.dispatch(Action.StoreProfile(profile: profile));

      // check that the store has the expected value
      expect(store.state.profile, profile);
    });
  });
}
