import 'package:dio/dio.dart';
import 'package:github/github.dart';
import 'package:github_desktop_flutter/models/profile/profile.dart';

class GitHubService {
  GitHubService(this._dio, this._github);

  final Dio _dio;
  final GitHub _github;

  Future<Profile> retrieveProfile(String token) async {
    Response response;
    response = await _dio.get<dynamic>('https://api.github.com/user',
        options: Options(
            headers: <String, dynamic>{'Authorization': 'token $token'},
            responseType: ResponseType.json));

    return Profile.fromJsonMap(response.data as Map<String, dynamic>);
  }
}
