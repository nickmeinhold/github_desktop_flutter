import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:github_desktop_flutter/models/app_state.dart';
import 'package:github_desktop_flutter/models/user.dart';
import 'package:github_desktop_flutter/widgets/account_avatar.dart';

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User>(
        distinct: true,
        converter: (Store<AppState> store) => store.state.user,
        builder: (BuildContext context, User user) {
          return Row(children: [
            AccountAvatar(user),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.displayName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user.email,
                      style: DefaultTextStyle.of(context)
                          .style
                          .apply(fontSizeFactor: 0.8),
                    )
                  ]),
            )
          ]);
        });
  }
}
