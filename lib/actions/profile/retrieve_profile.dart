library retrieve_profile;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:github_desktop_flutter/actions/redux_action.dart';
import 'package:github_desktop_flutter/models/app/serializers.dart';

part 'retrieve_profile.g.dart';

abstract class RetrieveProfile extends Object
    with ReduxAction
    implements Built<RetrieveProfile, RetrieveProfileBuilder> {
  RetrieveProfile._();

  factory RetrieveProfile([void Function(RetrieveProfileBuilder) updates]) =
      _$RetrieveProfile;

  Object toJson() =>
      serializers.serializeWith(RetrieveProfile.serializer, this);

  static RetrieveProfile fromJson(String jsonString) => serializers
      .deserializeWith(RetrieveProfile.serializer, json.decode(jsonString));

  static Serializer<RetrieveProfile> get serializer =>
      _$retrieveProfileSerializer;

  @override
  String toString() => 'RETRIEVE_PROFILE';
}
