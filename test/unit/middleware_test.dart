import 'package:github_desktop_flutter/models/actions.dart';
import 'package:github_desktop_flutter/models/app_state.dart';
import 'package:github_desktop_flutter/redux/middleware.dart';
import 'package:github_desktop_flutter/redux/reducers.dart';
import 'package:github_desktop_flutter/services/github_service.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

import '../mocks/github_service_mocks.dart';
import '../mocks/platform_service_mocks.dart';

class MockGitHubService extends Mock implements GitHubService {}

void main() {
  group('Middleware', () {
    test(
        '_storeTokenAndRetrieveProfile saves token, retrieves and stores profile',
        () async {
      final fakePlatformService = FakePlatformService();
      final fakeGitHubService = FakeGitHubService();

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(fakePlatformService, fakeGitHubService),
      );

      // dispatch action to observe the auth state
      await store.dispatch(Action.StoreAuthToken(token: 'token'));

      // check that the token was stored in local storage
      final retrievedToken = await fakePlatformService.retrieveToken();
      expect(retrievedToken, 'token');

      // check profile was stored correctly
      expect(store.state.profile, fakeGitHubService.profile);
    });

    test('_launchAuthPage uses service to launch github auth url', () async {
      final fakePlatformService = FakePlatformService();

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(fakePlatformService, null),
      );

      // dispatch action to launch the auth page
      await store.dispatch(Action.LaunchAuthPage());

      // TODO: check that the service got the expected url string
    });
  });
}
