import 'package:github/github.dart';
import 'package:http/src/client.dart';
import 'package:mockito/mockito.dart';

class FakeGitHub extends Fake implements GitHub {
  @override
  Authentication auth;

  @override
  // TODO: implement activity
  ActivityService get activity => throw UnimplementedError();

  @override
  // TODO: implement authorizations
  AuthorizationsService get authorizations => throw UnimplementedError();

  @override
  // TODO: implement checks
  ChecksService get checks => throw UnimplementedError();

  @override
  // TODO: implement client
  Client get client => throw UnimplementedError();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement endpoint
  String get endpoint => throw UnimplementedError();

  @override
  // TODO: implement gists
  GistsService get gists => throw UnimplementedError();

  @override
  // TODO: implement git
  GitService get git => throw UnimplementedError();

  @override
  // TODO: implement issues
  IssuesService get issues => throw UnimplementedError();

  @override
  // TODO: implement misc
  MiscService get misc => throw UnimplementedError();

  @override
  // TODO: implement organizations
  OrganizationsService get organizations => throw UnimplementedError();

  @override
  // TODO: implement pullRequests
  PullRequestsService get pullRequests => throw UnimplementedError();

  @override
  // TODO: implement rateLimitLimit
  int get rateLimitLimit => throw UnimplementedError();

  @override
  // TODO: implement rateLimitRemaining
  int get rateLimitRemaining => throw UnimplementedError();

  @override
  // TODO: implement rateLimitReset
  DateTime get rateLimitReset => throw UnimplementedError();

  @override
  // TODO: implement repositories
  RepositoriesService get repositories => throw UnimplementedError();

  @override
  // TODO: implement search
  SearchService get search => throw UnimplementedError();

  @override
  // TODO: implement urlShortener
  UrlShortenerService get urlShortener => throw UnimplementedError();

  @override
  // TODO: implement users
  UsersService get users => throw UnimplementedError();
}
