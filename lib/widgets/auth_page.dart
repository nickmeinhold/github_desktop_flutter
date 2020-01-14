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
        converter: (store) => store.state.authStep,
        builder: (context, authState) {
          return IndexedStack(
            alignment: Alignment.center,
            index: authState,
            children: <Widget>[
              RaisedButton(
                child: const Text('SIGN IN'),
                onPressed: () => StoreProvider.of<AppState>(context)
                    .dispatch(Action.SigninWithGoogle()),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Calling Google...')
                  ]),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Calling Firebase...')
                  ]),
            ],
          );
        });
  }
}
