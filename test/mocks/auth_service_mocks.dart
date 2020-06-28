import 'package:github_desktop_flutter/services/auth_service.dart';

class FakeAuthService implements AuthService {
  FakeAuthService(
      this._githubClientId, this._githubClientSecret, this._githubScopes);

  final String _githubClientId;
  final String _githubClientSecret;
  final List<String> _githubScopes;

  @override
  Future<String> getAuthToken() {
    // TODO: implement getAuthToken
    throw UnimplementedError();
  }
}
