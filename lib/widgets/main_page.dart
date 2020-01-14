import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_desktop_flutter/models/app_state.dart';
import 'package:github_desktop_flutter/models/user.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User>(
      distinct: true,
      converter: (store) => store.state.user,
      builder: (context, user) {
        return MaterialApp(
          home: Center(
            child: Material(
              child: Row(children: [
                // AccountInfo(),
                RaisedButton(
                  child: Text('run'),
                  onPressed: () {
                    _launchURL();
                  },
                )
              ]),
            ),
          ),
        );
      },
    );
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
