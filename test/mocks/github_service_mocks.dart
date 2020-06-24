import 'package:github_desktop_flutter/models/profile/profile.dart';
import 'package:github_desktop_flutter/services/github_service.dart';
import 'package:mockito/mockito.dart';

class FakeGitHubService extends Fake implements GitHubService {
  FakeGitHubService();

  final _profile = Profile((a) => a
    ..login = 'login'
    ..email = 'email'
    ..id = 1
    ..name = 'name'
    ..avatarUrl = 'url'
    ..location = 'Melbourne');

  Profile get profile => _profile;

  Future<Profile> retrieveProfile(String token) => Future.value(_profile);
}
