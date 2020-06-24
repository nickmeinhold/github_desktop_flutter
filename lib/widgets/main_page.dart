import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_desktop_flutter/actions/auth/sign_out.dart';
import 'package:github_desktop_flutter/extensions/extensions.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/models/profile/profile.dart';
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
                MaterialButton(
                  child: Text('SIGN OUT'),
                  onPressed: () => context.dispatch(SignOut()),
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
