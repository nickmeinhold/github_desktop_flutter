import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:github_desktop_flutter/actions/auth/authenticate.dart';
import 'package:github_desktop_flutter/actions/auth/check_auth_state.dart';
import 'package:github_desktop_flutter/actions/auth/observe_auth_state.dart';
import 'package:github_desktop_flutter/actions/auth/sign_out.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_step.dart';
import 'package:github_desktop_flutter/actions/auth/store_auth_token.dart';
import 'package:github_desktop_flutter/actions/problems/add_problem.dart';
import 'package:github_desktop_flutter/actions/profile/store_profile.dart';
import 'package:github_desktop_flutter/enums/auth_step.dart';
import 'package:github_desktop_flutter/enums/problem_type.dart';
import 'package:github_desktop_flutter/models/app/app_state.dart';
import 'package:github_desktop_flutter/models/app/problem.dart';
import 'package:github_desktop_flutter/models/profile/profile.dart';

part 'serializers.g.dart';

/// Once per app, define a top level "Serializer" to gather together
/// all the generated serializers.
///
/// Collection of generated serializers for the Flutter Github Desktop app
@SerializersFor([
  ObserveAuthState,
  CheckAuthState,
  StoreAuthStep,
  Authenticate,
  StoreAuthToken,
  StoreProfile,
  SignOut,
  Problem,
  AddProblem,
  AppState,
  Profile,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
