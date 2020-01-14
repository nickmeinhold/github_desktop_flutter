import 'package:redux/redux.dart';
import 'package:github_desktop_flutter/models/app_state.dart';

import '../services/github_service.dart';

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createMiddleware(GitHubService githubService) {
  return [];
}
