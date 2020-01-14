import 'package:flutter/material.dart';
import 'package:github_desktop_flutter/models/user.dart';

class AccountAvatar extends StatelessWidget {
  final User user;
  const AccountAvatar(this.user, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: (user.uid == null || user.photoUrl == null)
            ? const CircularProgressIndicator(
                value: null,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber))
            : Container(
                width: 40.0,
                height: 40.0,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: Image.network(user.photoUrl).image),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
      ),
    );
  }
}
