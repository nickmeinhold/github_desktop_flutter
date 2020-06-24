// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/redux/reducers.dart';
import 'package:github_desktop_flutter/widgets/main_page.dart';

import '../utils/image_test_utils.dart';

void main() {
  testWidgets('MainPage displays...', (WidgetTester tester) async {
    // create an initial state with a user
    final appState = AppState.init().rebuild((b) => b
      ..profile.id = 1
      ..profile.login = 'nickm'
      ..profile.email = 'nick.meinhold@gmail.com'
      ..profile.name = 'Nick'
      ..profile.avatarUrl = 'url'
      ..profile.location = 'Melbourne');
    final store = Store<AppState>(appReducer, initialState: appState);

    final textFinder = find.text('Nick');

    await provideMockedNetworkImages(() async {
      // build the widget and trigger a frame
      await tester.pumpWidget(
        // create a StoreProvider to wrap widget
        StoreProvider<AppState>(
          store: store,
          child: MaterialApp(home: MainPage()),
        ),
      );
    });

    // check that the display name is in the widget tree
    expect(textFinder, findsOneWidget);
  });
}
