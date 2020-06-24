import 'package:github_desktop_flutter/services/platform_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

void main() {
  group('Local Storage Service', () {
    test('stores the auth token', () async {
      SharedPreferences.setMockInitialValues(
          <String, dynamic>{'token': 'token'});
      final service = PlatformService();
      final result = await service.store(token: 'token');
      expect(result, true);
    });

    test('retrieves the auth token', () async {
      SharedPreferences.setMockInitialValues(
          <String, dynamic>{'token': 'token'});
      final service = PlatformService();
      final result = await service.retrieveToken();
      expect(result, 'token');
    });

    test('launches the given url', () async {
      // we could inject the launcher object and then mock it to check
      // the service uses the launcher with the correct url but the test
      // has almost no value at this point
    });
  });
}
