library sign_out;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:github_desktop_flutter/actions/redux_action.dart';
import 'package:github_desktop_flutter/models/app/serializers.dart';

part 'sign_out.g.dart';

abstract class SignOut extends Object
    with ReduxAction
    implements Built<SignOut, SignOutBuilder> {
  SignOut._();

  factory SignOut([void Function(SignOutBuilder) updates]) = _$SignOut;

  Object toJson() => serializers.serializeWith(SignOut.serializer, this);

  static SignOut fromJson(String jsonString) =>
      serializers.deserializeWith(SignOut.serializer, json.decode(jsonString));

  static Serializer<SignOut> get serializer => _$signOutSerializer;

  @override
  String toString() => 'SIGN_OUT';
}
