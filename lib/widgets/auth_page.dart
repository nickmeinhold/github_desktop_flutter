import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_desktop_flutter/models/actions.dart';
import 'package:github_desktop_flutter/models/app_state.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, int>(
        distinct: true,
        onInit: (store) => store.dispatch(CheckForAuthToken()),
        converter: (store) => store.state.authStep,
        builder: (context, authStep) {
          return Scaffold(
            body: IndexedStack(
              alignment: Alignment.center,
              index: authStep,
              children: <Widget>[
                // Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       CircularProgressIndicator(),
                //       Text('Checking for auth token...')
                //     ]),
                Column(
                  children: [
                    TextField(
                      onChanged: (text) => StoreProvider.of<AppState>(context)
                          .dispatch(UpdateUsername(text: text)),
                    ),
                    TextField(
                      obscureText: true,
                      onChanged: (text) => StoreProvider.of<AppState>(context)
                          .dispatch(UpdatePassword(text: text)),
                    ),
                    RaisedButton(
                      child: const Text('SIGN IN'),
                      onPressed: () {
                        StoreProvider.of<AppState>(context)
                            .dispatch(SignInBasic());
                        // StoreProvider.of<AppState>(context)
                        //     .dispatch(Action.LaunchAuthPage());
                        // StoreProvider.of<AppState>(context)
                        //     .dispatch(Action.StoreAuthStep(step: 2));
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
            StoreProvider.of<AppState>(context)
                .dispatch(Action.StoreAuthStep(step: 3));
            StoreProvider.of<AppState>(context)
                .dispatch(Action.StoreAuthToken(token: token));
          },
        ),
        // TODO: add a CANCEL button to return to auth step 0
      ],
    );
  }
}
