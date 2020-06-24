library app_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:github_desktop_flutter/models/problem.dart';
import 'package:github_desktop_flutter/models/profile.dart';
import 'package:github_desktop_flutter/models/serializers.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  // non-nullable
  int get authStep;

  @nullable
  String get username;
  @nullable
  String get password;

  @nullable
  String get authToken;
  @nullable
  Profile get profile;

  // collections
  BuiltList<Problem> get problems;

  AppState._();

  factory AppState.init() => AppState((a) => a
    ..problems = ListBuilder<Problem>()
    ..authStep = 0);

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  Object toJson() => serializers.serializeWith(AppState.serializer, this);

  static AppState fromJson(String jsonString) =>
      serializers.deserializeWith(AppState.serializer, json.decode(jsonString));

  static Serializer<AppState> get serializer => _$appStateSerializer;
}
