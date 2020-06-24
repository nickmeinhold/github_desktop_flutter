library store_auth_step;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:github_desktop_flutter/actions/redux_action.dart';
import 'package:github_desktop_flutter/enums/auth_step.dart';
import 'package:github_desktop_flutter/models/app/serializers.dart';

part 'store_auth_step.g.dart';

abstract class StoreAuthStep extends Object
    with ReduxAction
    implements Built<StoreAuthStep, StoreAuthStepBuilder> {
  AuthStep get step;

  StoreAuthStep._();

  factory StoreAuthStep([void Function(StoreAuthStepBuilder) updates]) =
      _$StoreAuthStep;

  Object toJson() => serializers.serializeWith(StoreAuthStep.serializer, this);

  static StoreAuthStep fromJson(String jsonString) => serializers
      .deserializeWith(StoreAuthStep.serializer, json.decode(jsonString));

  static Serializer<StoreAuthStep> get serializer => _$storeAuthStepSerializer;

  @override
  String toString() => 'STORE_AUTH_STEP';
}
