// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_profile;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreProfile> _$storeProfileSerializer =
    new _$StoreProfileSerializer();

class _$StoreProfileSerializer implements StructuredSerializer<StoreProfile> {
  @override
  final Iterable<Type> types = const [StoreProfile, _$StoreProfile];
  @override
  final String wireName = 'StoreProfile';

  @override
  Iterable<Object> serialize(Serializers serializers, StoreProfile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'profile',
      serializers.serialize(object.profile,
          specifiedType: const FullType(Profile)),
    ];

    return result;
  }

  @override
  StoreProfile deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreProfileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'profile':
          result.profile.replace(serializers.deserialize(value,
              specifiedType: const FullType(Profile)) as Profile);
          break;
      }
    }

    return result.build();
  }
}

class _$StoreProfile extends StoreProfile {
  @override
  final Profile profile;

  factory _$StoreProfile([void Function(StoreProfileBuilder) updates]) =>
      (new StoreProfileBuilder()..update(updates)).build();

  _$StoreProfile._({this.profile}) : super._() {
    if (profile == null) {
      throw new BuiltValueNullFieldError('StoreProfile', 'profile');
    }
  }

  @override
  StoreProfile rebuild(void Function(StoreProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreProfileBuilder toBuilder() => new StoreProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreProfile && profile == other.profile;
  }

  @override
  int get hashCode {
    return $jf($jc(0, profile.hashCode));
  }
}

class StoreProfileBuilder
    implements Builder<StoreProfile, StoreProfileBuilder> {
  _$StoreProfile _$v;

  ProfileBuilder _profile;
  ProfileBuilder get profile => _$this._profile ??= new ProfileBuilder();
  set profile(ProfileBuilder profile) => _$this._profile = profile;

  StoreProfileBuilder();

  StoreProfileBuilder get _$this {
    if (_$v != null) {
      _profile = _$v.profile?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreProfile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StoreProfile;
  }

  @override
  void update(void Function(StoreProfileBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreProfile build() {
    _$StoreProfile _$result;
    try {
      _$result = _$v ?? new _$StoreProfile._(profile: profile.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'profile';
        profile.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'StoreProfile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
