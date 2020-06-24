// GENERATED CODE - DO NOT MODIFY BY HAND

part of check_for_auth_token;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CheckForAuthToken> _$checkForAuthTokenSerializer =
    new _$CheckForAuthTokenSerializer();

class _$CheckForAuthTokenSerializer
    implements StructuredSerializer<CheckForAuthToken> {
  @override
  final Iterable<Type> types = const [CheckForAuthToken, _$CheckForAuthToken];
  @override
  final String wireName = 'CheckForAuthToken';

  @override
  Iterable<Object> serialize(Serializers serializers, CheckForAuthToken object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  CheckForAuthToken deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new CheckForAuthTokenBuilder().build();
  }
}

class _$CheckForAuthToken extends CheckForAuthToken {
  factory _$CheckForAuthToken(
          [void Function(CheckForAuthTokenBuilder) updates]) =>
      (new CheckForAuthTokenBuilder()..update(updates)).build();

  _$CheckForAuthToken._() : super._();

  @override
  CheckForAuthToken rebuild(void Function(CheckForAuthTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckForAuthTokenBuilder toBuilder() =>
      new CheckForAuthTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckForAuthToken;
  }

  @override
  int get hashCode {
    return 939413160;
  }
}

class CheckForAuthTokenBuilder
    implements Builder<CheckForAuthToken, CheckForAuthTokenBuilder> {
  _$CheckForAuthToken _$v;

  CheckForAuthTokenBuilder();

  @override
  void replace(CheckForAuthToken other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CheckForAuthToken;
  }

  @override
  void update(void Function(CheckForAuthTokenBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CheckForAuthToken build() {
    final _$result = _$v ?? new _$CheckForAuthToken._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
