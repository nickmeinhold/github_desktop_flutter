library observe_auth_state;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:github_desktop_flutter/actions/redux_action.dart';
import 'package:github_desktop_flutter/models/app/serializers.dart';

part 'observe_auth_state.g.dart';

abstract class ObserveAuthState extends Object
    with ReduxAction
    implements Built<ObserveAuthState, ObserveAuthStateBuilder> {
  ObserveAuthState._();

  factory ObserveAuthState([void Function(ObserveAuthStateBuilder) updates]) =
      _$ObserveAuthState;

  Object toJson() =>
      serializers.serializeWith(ObserveAuthState.serializer, this);

  static ObserveAuthState fromJson(String jsonString) => serializers
      .deserializeWith(ObserveAuthState.serializer, json.decode(jsonString));

  static Serializer<ObserveAuthState> get serializer =>
      _$observeAuthStateSerializer;

  @override
  String toString() => 'OBSERVE_AUTH_STATE';
}
