import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_desktop_flutter/reducers/reducers.dart';
import 'package:redux/redux.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/widgets/more_options_page.dart';

void main() {
  testWidgets('MoreOptionsPage displays...', (WidgetTester tester) async {
    // create a basic store with middleware that uses the AuthService to
    // observe auth state and a reducer that saves the emitted auth state
    final store = Store<AppState>(appReducer, initialState: AppState.init());

    final signoutFinder = find.text('SIGN OUT');

    // build our app and trigger a frame
    await tester.pumpWidget(
      // create a StoreProvider to wrap widget
      StoreProvider<AppState>(
        store: store,
        child: MaterialApp(home: Material(child: MoreOptionsPage())),
      ),
    );

    // check that the Text with the expected String is in the widget tree
    expect(signoutFinder, findsOneWidget);
  });
}
