import 'package:built_collection/built_collection.dart';
import 'package:github_desktop_flutter/enums/auth_step.dart';
import 'package:github_desktop_flutter/enums/problem_type.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/models/app/problem.dart';
import 'package:github_desktop_flutter/models/profile/profile.dart';
import 'package:test/test.dart';

void main() {
  ///
  /// -- Non-nullable
  ///
  /// int authStep
  ///
  /// -- Nullable
  ///
  /// String authToken
  /// Profile profile
  ///
  /// -- Collections
  ///
  /// BuiltList<Problem> problems

  group('ApState', () {
    test('deals with null for nullable members', () {
      final appState = AppState((b) => b..authStep = AuthStep.waitingForInput);

      expect(appState.authStep, 0);
      expect(appState.authToken, null);
      expect(appState.profile, null);
      expect(appState.problems, <Problem>[]);
    });

    test('members take expected values', () {
      final profile = Profile((a) => a
        ..login = 'login'
        ..email = 'email'
        ..id = 1
        ..name = 'name'
        ..avatarUrl = 'url'
        ..location = 'Melbourne');

      final problem = Problem((a) => a
        ..message = 'message'
        ..type = ProblemType.authenticate
        ..info = MapBuilder({'test': 'test'})
        ..state.replace(AppState.init())
        ..trace = StackTrace.current.toString());

      final appState = AppState((b) => b
        ..authStep = AuthStep.waitingForInput
        ..authToken = 'token'
        ..problems.add(problem)
        ..profile.replace(profile));

      expect(appState.authStep, 0);
      expect(appState.authToken, 'token');
      expect(appState.problems, [problem]);
      expect(appState.profile, profile);
    });
  });
}
