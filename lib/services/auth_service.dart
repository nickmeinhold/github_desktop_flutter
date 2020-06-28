import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:url_launcher/url_launcher.dart';

class AuthService {
  AuthService(
      this._githubClientId, this._githubClientSecret, this._githubScopes) {
    // create the grant used to generate the authorization url
    _grant = oauth2.AuthorizationCodeGrant(
      _githubClientId,
      _authorizationEndpoint,
      _tokenEndpoint,
      secret: _githubClientSecret,
      httpClient: _JsonAcceptingHttpClient(),
    );
  }

  HttpServer _redirectServer;
  // used to generate the authorization url
  oauth2.AuthorizationCodeGrant _grant;
  final String _githubClientId;
  final String _githubClientSecret;
  final List<String> _githubScopes;

  final _authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');
  final _tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');

  Future<String> getAuthToken() async {
    await _redirectServer?.close();
    // Bind to an ephemeral port on localhost
    _redirectServer = await HttpServer.bind('localhost', 0);

    final redirectUrl =
        Uri.parse('http://localhost:${_redirectServer.port}/auth');

    final authorizationUrl =
        _grant.getAuthorizationUrl(redirectUrl, scopes: _githubScopes);

    await _redirect(authorizationUrl);

    final parameters = await _listen();

    final responseBody = await http.read(
        'https://us-central1-flutter-github-desktop.cloudfunctions.net/getToken',
        headers: parameters);

    dynamic jsonObject = json.decode(responseBody);
    final token = jsonObject['access_token'] as String;

    return token;
  }

  Future<void> _redirect(Uri authorizationUrl) async {
    var url = authorizationUrl.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw GitHubLoginException('Could not launch $url');
    }
  }

  Future<Map<String, String>> _listen() async {
    var request = await _redirectServer.first;
    var params = request.uri.queryParameters;
    request.response.statusCode = 200;
    request.response.headers.set('content-type', 'text/plain');
    request.response.writeln('Authenticated! You can close this tab.');
    await request.response.close();
    await _redirectServer.close();
    _redirectServer = null;
    return params;
  }
}

class _JsonAcceptingHttpClient extends http.BaseClient {
  final _httpClient = http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return _httpClient.send(request);
  }
}

class GitHubLoginException implements Exception {
  const GitHubLoginException(this.message);
  final String message;
  @override
  String toString() => message;
}
