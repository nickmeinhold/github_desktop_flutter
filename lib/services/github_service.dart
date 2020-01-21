import 'package:dio/dio.dart';
import 'package:github_desktop_flutter/models/profile.dart';

class GitHubService {
  GitHubService(this.dio);

  final Dio dio;

  Future<Profile> retrieveProfile(String token) async {
    Response response;
    response = await dio.get('https://api.github.com/user',
        options: Options(
            headers: {'Authorization': 'token $token'},
            responseType: ResponseType.json));

    return Profile.fromJsonMap(response.data as Map<String, dynamic>);
  }
}
