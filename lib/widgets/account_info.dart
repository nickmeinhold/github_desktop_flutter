import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_desktop_flutter/models/profile/profile.dart';
import 'package:redux/redux.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/widgets/account_avatar.dart';

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Profile>(
        distinct: true,
        converter: (Store<AppState> store) => store.state.profile,
        builder: (BuildContext context, Profile profile) {
          return Row(children: [
            AccountAvatar(profile),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      profile.email,
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
