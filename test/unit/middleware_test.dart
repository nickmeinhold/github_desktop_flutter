import 'package:github_desktop_flutter/actions/auth/authenticate.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_token.dart';
import 'package:github_desktop_flutter/middleware/middleware.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/reducers/reducers.dart';
import 'package:github_desktop_flutter/services/github_service.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';
import 'package:test/test.dart';

import '../mocks/auth_service_mocks.dart';
import '../mocks/github_service_mocks.dart';
import '../mocks/platform_service_mocks.dart';

class MockGitHubService extends Mock implements GitHubService {}

void main() {
  group('Middleware', () {
    test(
        '_storeTokenAndRetrieveProfile saves token, retrieves and stores profile',
        () async {
      final fakePlatformService = FakePlatformService();
      final fakeAuthService = FakeAuthService(
          'githubClientId', 'githubClientSecret', ['githubScopes']);
      final fakeGitHubService = FakeGitHubService();

      // create a basic store with the mocked out middleware
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
        middleware: createMiddleware(
            fakePlatformService, fakeAuthService, fakeGitHubService),
      );

      // dispatch action to observe the auth state
      await store.dispatch(StoreAuthToken((b) => b..token = 'token'));

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
        middleware: createMiddleware(fakePlatformService, null, null),
      );

      // dispatch action to launch the auth page
      await store.dispatch(Authenticate());

      // TODO: check that the service got the expected url string
    });
  });
}
