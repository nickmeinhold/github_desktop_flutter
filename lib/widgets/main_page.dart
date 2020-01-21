import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_desktop_flutter/models/app_state.dart';
import 'package:github_desktop_flutter/models/profile.dart';
import 'package:github_desktop_flutter/widgets/account_info.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Profile>(
      distinct: true,
      converter: (store) => store.state.profile,
      builder: (context, profile) {
        return MaterialApp(
          home: Center(
            child: Material(
              child: Row(children: [
                AccountInfo(),
              ]),
            ),
          ),
        );
      },
    );
  }
}
