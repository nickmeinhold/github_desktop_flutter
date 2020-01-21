import 'package:github_desktop_flutter/services/github_service.dart';
import 'package:test/test.dart';

import '../../data/profile_json.dart';
import '../../mocks/dio_mocks.dart';

void main() {
  group('GitHub Service', () {
    test('deserializes json', () async {
      final token = '';
      final service = GitHubService(DioFake(response: profile_json_data));

      final profile = await service.retrieveProfile(token);

      expect(profile.login, 'nickmeinhold');
      expect(profile.id, 1059276);
      expect(profile.avatarUrl,
          'https://avatars2.githubusercontent.com/u/1059276?v=4');
      expect(profile.email, 'nick.meinhold@gmail.com');
      expect(profile.name, 'Nick Meinhold');
      expect(profile.location, 'Melbourne, Australia');
    });
  });
}
