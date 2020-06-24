// GENERATED CODE - DO NOT MODIFY BY HAND

part of retrieve_profile;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RetrieveProfile> _$retrieveProfileSerializer =
    new _$RetrieveProfileSerializer();

class _$RetrieveProfileSerializer
    implements StructuredSerializer<RetrieveProfile> {
  @override
  final Iterable<Type> types = const [RetrieveProfile, _$RetrieveProfile];
  @override
  final String wireName = 'RetrieveProfile';

  @override
  Iterable<Object> serialize(Serializers serializers, RetrieveProfile object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  RetrieveProfile deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new RetrieveProfileBuilder().build();
  }
}

class _$RetrieveProfile extends RetrieveProfile {
  factory _$RetrieveProfile([void Function(RetrieveProfileBuilder) updates]) =>
      (new RetrieveProfileBuilder()..update(updates)).build();

  _$RetrieveProfile._() : super._();

  @override
  RetrieveProfile rebuild(void Function(RetrieveProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RetrieveProfileBuilder toBuilder() =>
      new RetrieveProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RetrieveProfile;
  }

  @override
  int get hashCode {
    return 312254461;
  }
}

class RetrieveProfileBuilder
    implements Builder<RetrieveProfile, RetrieveProfileBuilder> {
  _$RetrieveProfile _$v;

  RetrieveProfileBuilder();

  @override
  void replace(RetrieveProfile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RetrieveProfile;
  }

  @override
  void update(void Function(RetrieveProfileBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RetrieveProfile build() {
    final _$result = _$v ?? new _$RetrieveProfile._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
