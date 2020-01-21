import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:github_desktop_flutter/models/app_state.dart';
import 'package:github_desktop_flutter/redux/reducers.dart';
import 'package:github_desktop_flutter/widgets/auth_page.dart';

void main() {
  group('AuthPage', () {
    // TODO: test that LaunchAuthPage is dispatched on SIGN IN button tap
    // TODO: test that StoreAuthToken is dispatched with contents of textfield
    testWidgets('increments auth step and shows relevant UI',
        (WidgetTester tester) async {
      final signinButtonFinder = find.text('SIGN IN');
      final tokenEntryWidgetFinder = find.byType(TokenEntry);
      final submitButtonFinder = find.byIcon(Icons.swap_vert);
      final progressIndicatorFinder = find.byType(CircularProgressIndicator);

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

      // check that the Text with the expected String is in the widget tree
      expect(signinButtonFinder, findsOneWidget);

      await tester.tap(signinButtonFinder);

      // check that the auth step has been incremented
      expect(store.state.authStep, 1);

      // check token entry UI is now shown
      expect(tokenEntryWidgetFinder, findsOneWidget);

      // tap submit button and check next UI is shown
      await tester.tap(submitButtonFinder);
      expect(progressIndicatorFinder, findsOneWidget);
    });
  });
}
