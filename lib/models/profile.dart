library profile;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:github_desktop_flutter/models/serializers.dart';

part 'profile.g.dart';

abstract class Profile implements Built<Profile, ProfileBuilder> {
  String get login;
  int get id;
  @BuiltValueField(wireName: 'avatar_url')
  String get avatarUrl;
  String get email;
  String get name;
  String get location;

  Profile._();

  factory Profile([void Function(ProfileBuilder) updates]) = _$Profile;

  Object toJson() => serializers.serializeWith(Profile.serializer, this);

  static Profile fromJsonString(String jsonString) =>
      serializers.deserializeWith(Profile.serializer, json.decode(jsonString));
  static Profile fromJsonMap(Map<String, dynamic> jsonMap) =>
      serializers.deserializeWith(Profile.serializer, jsonMap);

  static Serializer<Profile> get serializer => _$profileSerializer;
}
