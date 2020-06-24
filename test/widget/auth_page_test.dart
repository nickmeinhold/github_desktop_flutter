import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_step.dart';
import 'package:github_desktop_flutter/enums/auth_step.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/reducers/reducers.dart';
import 'package:github_desktop_flutter/widgets/auth_page.dart';
import 'package:redux/redux.dart';

void main() {
  group('AuthPage', () {
    // TODO: test that LaunchAuthPage is dispatched on SIGN IN button tap
    // TODO: test that StoreAuthToken is dispatched with contents of textfield
    // TODO: find how to test widgets are visible rather than just in the
    // widget tree (as all widgets in IndexedStack are in the tree)
    testWidgets('increments auth step and shows relevant UI',
        (WidgetTester tester) async {
      final signinButtonFinder = find.text('SIGN IN');
      final tokenEntryWidgetFinder = find.byType(TokenEntry);
      final submitButtonFinder = find.byIcon(Icons.swap_vert);
      final retrievingFinder = find.text('Retrieving Profile...');

      // create a basic store with middleware, services and reducers
      final store = Store<AppState>(
        appReducer,
        initialState: AppState.init(),
      );

      // build our app and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(home: AuthPage()),
        ),
      );

      // the check for an auth token sets the step
      // we could mock the middleware and add to the store but it's easier to
      // just set the step
      store.dispatch(StoreAuthStep((b) => b..step = AuthStep.signingIn));
      expect(store.state.authStep, 1);

      await tester.pump();

      // check that the Text with the expected String is in the widget tree
      expect(signinButtonFinder, findsOneWidget);

      await tester.tap(signinButtonFinder);

      // check that the auth step has been incremented
      expect(store.state.authStep, 2);

      // check token entry UI is now shown
      expect(tokenEntryWidgetFinder, findsOneWidget);

      // tap submit button and check next UI is shown
      await tester.tap(submitButtonFinder);
      expect(retrievingFinder, findsOneWidget);
    });
  });
}
