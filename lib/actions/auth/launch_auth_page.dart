library launch_auth_page;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:github_desktop_flutter/actions/redux_action.dart';
import 'package:github_desktop_flutter/models/app/serializers.dart';

part 'launch_auth_page.g.dart';

abstract class LaunchAuthPage extends Object
    with ReduxAction
    implements Built<LaunchAuthPage, LaunchAuthPageBuilder> {
  LaunchAuthPage._();

  factory LaunchAuthPage([void Function(LaunchAuthPageBuilder) updates]) =
      _$LaunchAuthPage;

  Object toJson() => serializers.serializeWith(LaunchAuthPage.serializer, this);

  static LaunchAuthPage fromJson(String jsonString) => serializers
      .deserializeWith(LaunchAuthPage.serializer, json.decode(jsonString));

  static Serializer<LaunchAuthPage> get serializer =>
      _$launchAuthPageSerializer;

  @override
  String toString() => 'LAUNCH_AUTH_PAGE';
}
