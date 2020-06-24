// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_step.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AuthStep _$checking = const AuthStep._('checking');
const AuthStep _$waitingForInput = const AuthStep._('waitingForInput');
const AuthStep _$signingIn = const AuthStep._('signingIn');
const AuthStep _$authenticating = const AuthStep._('authenticating');

AuthStep _$valueOf(String name) {
  switch (name) {
    case 'checking':
      return _$checking;
    case 'waitingForInput':
      return _$waitingForInput;
    case 'signingIn':
      return _$signingIn;
    case 'authenticating':
      return _$authenticating;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AuthStep> _$values = new BuiltSet<AuthStep>(const <AuthStep>[
  _$checking,
  _$waitingForInput,
  _$signingIn,
  _$authenticating,
]);

Serializer<AuthStep> _$authStepSerializer = new _$AuthStepSerializer();

class _$AuthStepSerializer implements PrimitiveSerializer<AuthStep> {
  @override
  final Iterable<Type> types = const <Type>[AuthStep];
  @override
  final String wireName = 'AuthStep';

  @override
  Object serialize(Serializers serializers, AuthStep object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AuthStep deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AuthStep.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
