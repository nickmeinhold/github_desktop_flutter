import 'package:github_desktop_flutter/services/platform_service.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';

class FakePlatformService extends Fake implements PlatformService {
  FakePlatformService();

  String _token;

  Future<bool> store({@required String token}) {
    _token = token;
    return Future.value(true);
  }

  Future<String> retrieveToken() {
    return Future.value(_token);
  }
}
