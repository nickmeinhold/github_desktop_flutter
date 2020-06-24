import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:github_desktop_flutter/models/app/serializers.dart';

part 'auth_step.g.dart';

class AuthStep extends EnumClass {
  static Serializer<AuthStep> get serializer => _$authStepSerializer;
  static const AuthStep checking = _$checking;
  static const AuthStep waitingForInput = _$waitingForInput;
  static const AuthStep signingIn = _$signingIn;
  static const AuthStep authenticating = _$authenticating;
  static const Map<AuthStep, int> _$indexMap = {
    checking: 0,
    waitingForInput: 1,
    signingIn: 2,
    authenticating: 3
  };

  const AuthStep._(String name) : super(name);

  int get index => _$indexMap[this];
  static BuiltSet<AuthStep> get values => _$values;
  static AuthStep valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(AuthStep.serializer, this);
}
