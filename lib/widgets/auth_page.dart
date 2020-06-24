import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_desktop_flutter/actions/auth/check_for_auth_token.dart';
import 'package:github_desktop_flutter/actions/auth/launch_auth_page.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_step.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_token.dart';
import 'package:github_desktop_flutter/enums/auth_step.dart';
import 'package:github_desktop_flutter/extensions/extensions.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthStep>(
        distinct: true,
        onInit: (store) => store.dispatch(CheckForAuthToken()),
        converter: (store) => store.state.authStep,
        builder: (context, authStep) {
          return Scaffold(
            body: IndexedStack(
              alignment: Alignment.center,
              index: authStep.index,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Checking for auth token...')
                    ]),
                Column(
                  children: [
                    RaisedButton(
                      child: const Text('SIGN IN'),
                      onPressed: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(LaunchAuthPage());
                        context.dispatch(
                            StoreAuthStep((b) => b..step = AuthStep.signingIn));
                      },
                    ),
                  ],
                )

                // TokenEntry(),
                // Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       CircularProgressIndicator(),
                //       Text('Retrieving Profile...')
                //     ]),
              ],
            ),
          );
        });
  }
}

class TokenEntry extends StatefulWidget {
  @override
  _TokenEntryState createState() => _TokenEntryState();
}

class _TokenEntryState extends State<TokenEntry> {
  String token;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(hintText: 'Enter the auth token'),
            onChanged: (text) => token = text,
          ),
        ),
        FlatButton(
          child: Icon(Icons.swap_vert),
          onPressed: () {
            context.dispatch(
                StoreAuthStep((b) => b..step = AuthStep.authenticating));
            StoreProvider.of<AppState>(context)
                .dispatch(StoreAuthToken((b) => b..token = token));
          },
        ),
        // TODO: add a CANCEL button to return to auth step 0
      ],
    );
  }
}
