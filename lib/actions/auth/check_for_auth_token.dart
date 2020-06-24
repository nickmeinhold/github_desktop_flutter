library check_for_auth_token;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:github_desktop_flutter/actions/redux_action.dart';
import 'package:github_desktop_flutter/models/app/serializers.dart';

part 'check_for_auth_token.g.dart';

abstract class CheckForAuthToken extends Object
    with ReduxAction
    implements Built<CheckForAuthToken, CheckForAuthTokenBuilder> {
  CheckForAuthToken._();

  factory CheckForAuthToken([void Function(CheckForAuthTokenBuilder) updates]) =
      _$CheckForAuthToken;

  Object toJson() =>
      serializers.serializeWith(CheckForAuthToken.serializer, this);

  static CheckForAuthToken fromJson(String jsonString) => serializers
      .deserializeWith(CheckForAuthToken.serializer, json.decode(jsonString));

  static Serializer<CheckForAuthToken> get serializer =>
      _$checkForAuthTokenSerializer;

  @override
  String toString() => 'CHECK_FOR_AUTH_TOKEN';
}
