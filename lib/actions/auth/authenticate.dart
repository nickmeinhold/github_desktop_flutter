library authenticate;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:github_desktop_flutter/actions/redux_action.dart';
import 'package:github_desktop_flutter/models/app/serializers.dart';

part 'authenticate.g.dart';

abstract class Authenticate extends Object
    with ReduxAction
    implements Built<Authenticate, AuthenticateBuilder> {
  Authenticate._();

  factory Authenticate([void Function(AuthenticateBuilder) updates]) =
      _$Authenticate;

  Object toJson() => serializers.serializeWith(Authenticate.serializer, this);

  static Authenticate fromJson(String jsonString) => serializers
      .deserializeWith(Authenticate.serializer, json.decode(jsonString));

  static Serializer<Authenticate> get serializer => _$authenticateSerializer;

  @override
  String toString() => 'AUTHENTICATE';
}
