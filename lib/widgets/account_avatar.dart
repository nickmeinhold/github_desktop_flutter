import 'package:flutter/material.dart';
import 'package:github_desktop_flutter/models/profile.dart';

class AccountAvatar extends StatelessWidget {
  final Profile profile;
  const AccountAvatar(this.profile, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: (profile.id == null || profile.avatarUrl == null)
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
                      image: Image.network(profile.avatarUrl).image),
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
