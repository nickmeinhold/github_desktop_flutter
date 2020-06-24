library store_profile;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:github_desktop_flutter/actions/redux_action.dart';
import 'package:github_desktop_flutter/models/app/serializers.dart';
import 'package:github_desktop_flutter/models/profile/profile.dart';

part 'store_profile.g.dart';

abstract class StoreProfile extends Object
    with ReduxAction
    implements Built<StoreProfile, StoreProfileBuilder> {
  Profile get profile;

  StoreProfile._();

  factory StoreProfile([void Function(StoreProfileBuilder) updates]) =
      _$StoreProfile;

  Object toJson() => serializers.serializeWith(StoreProfile.serializer, this);

  static StoreProfile fromJson(String jsonString) => serializers
      .deserializeWith(StoreProfile.serializer, json.decode(jsonString));

  static Serializer<StoreProfile> get serializer => _$storeProfileSerializer;

  @override
  String toString() => 'STORE_PROFILE';
}
