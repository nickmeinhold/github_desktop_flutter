import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_desktop_flutter/actions/auth/check_auth_state.dart';
import 'package:github_desktop_flutter/actions/auth/authenticate.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_step.dart';
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
        onInit: (store) => store.dispatch(CheckAuthState()),
        converter: (store) => store.state.authStep,
        builder: (context, authStep) {
          return Scaffold(
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IndexedStack(
                      alignment: Alignment.center,
                      index: authStep.index,
                      children: <Widget>[
                        ProgressWithText(text: 'Checking for auth token...'),
                        SignInButton(),
                        ProgressWithText(text: 'Retrieving auth token...'),
                      ],
                    ),
                  ]),
            ),
          );
        });
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: const Text('SIGN IN'),
          onPressed: () {
            context.dispatch(Authenticate());
            context
                .dispatch(StoreAuthStep((b) => b..step = AuthStep.signingIn));
          },
        ),
      ],
    );
  }
}

class ProgressWithText extends StatelessWidget {
  final String text;
  const ProgressWithText({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[CircularProgressIndicator(), Text(text)]);
  }
}
