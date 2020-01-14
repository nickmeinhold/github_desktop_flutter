import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MoreOptionsPage extends StatelessWidget {
  const MoreOptionsPage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: RaisedButton(
            child: Text('SIGN OUT'),
            onPressed: () {
              // TODO: Sign out of github
              FirebaseAuth.instance.signOut();
            },
          ),
        )
      ],
    );
  }
}
