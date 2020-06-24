import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:github_desktop_flutter/enums/problem_type.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/models/app/problem.dart';
import 'package:test/test.dart';

void main() {
  group('Problem', () {
    // create a Problem with expected values
    test('members take expected values', () {
      // save the current trace
      final trace = StackTrace.current;

      final problem = Problem((a) => a
        ..message = 'message'
        ..type = ProblemType.signIn
        ..info = MapBuilder({'test': 'test'})
        ..state.replace(AppState.init())
        ..trace = trace.toString());

      // check the members hold the expected values
      expect(problem.info, {'test': 'test'});
      expect(problem.state, AppState.init());
      expect(problem.trace, trace.toString());
      expect(problem.type, ProblemType.signIn);
      expect(problem.message, 'message');
    });

    test('members that are nullable default to null', () {
      // message and type are non-nullable
      // trace, state and info are nullable
      final problem = Problem((a) => a
        ..message = 'message'
        ..type = ProblemType.signIn);

      // so the members should be:
      expect(problem.info, null);
      expect(problem.state, null);
      expect(problem.trace, null);
      expect(problem.type, ProblemType.signIn);
      expect(problem.message, 'message');
    });

    test('will throw without non-null members', () {
      // message and type are non-nullable
      // trace, state and info are nullable

      // so no type should throw
      expect(() => Problem((b) => b..message = 'message'),
          throwsA(const TypeMatcher<BuiltValueNullFieldError>()));

      // and no message should also throw
      expect(() => Problem((a) => a..type = ProblemType.signIn),
          throwsA(const TypeMatcher<BuiltValueNullFieldError>()));

      // whereas missing trace, state or info should be fine
      expect(
          Problem((a) => a
            ..message = 'message'
            ..type = ProblemType.signIn),
          equals(Problem((a) => a
            ..message = 'message'
            ..type = ProblemType.signIn)));
    });
  });
}
