import 'package:flutter/material.dart' hide Action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_desktop_flutter/models/actions.dart';
import 'package:github_desktop_flutter/models/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

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
                onPressed: () => _launchURL(),
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

  _launchURL() async {
    const String url = 'https://github.com/login/oauth/authorize' +
        '?client_id=987bd965a05598c5e090' +
        '&scope=public_repo%20read:user%20user:email';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
