import 'package:github_desktop_flutter/models/profile.dart';
import 'package:test/test.dart';

void main() {
  group('Profile', () {
    test('members take expected values', () {
      final profile = Profile((a) => a
        ..login = 'login'
        ..email = 'email'
        ..id = 1
        ..name = 'name'
        ..avatarUrl = 'url'
        ..location = 'Melbourne');

      expect(profile.login, 'login');
      expect(profile.email, 'email');
      expect(profile.id, 1);
      expect(profile.name, 'name');
      expect(profile.avatarUrl, 'url');
      expect(profile.location, 'Melbourne');
    });
  });
}
