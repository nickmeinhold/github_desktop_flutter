// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_auth_token;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreAuthToken> _$storeAuthTokenSerializer =
    new _$StoreAuthTokenSerializer();

class _$StoreAuthTokenSerializer
    implements StructuredSerializer<StoreAuthToken> {
  @override
  final Iterable<Type> types = const [StoreAuthToken, _$StoreAuthToken];
  @override
  final String wireName = 'StoreAuthToken';

  @override
  Iterable<Object> serialize(Serializers serializers, StoreAuthToken object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'token',
      serializers.serialize(object.token,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  StoreAuthToken deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreAuthTokenBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$StoreAuthToken extends StoreAuthToken {
  @override
  final String token;

  factory _$StoreAuthToken([void Function(StoreAuthTokenBuilder) updates]) =>
      (new StoreAuthTokenBuilder()..update(updates)).build();

  _$StoreAuthToken._({this.token}) : super._() {
    if (token == null) {
      throw new BuiltValueNullFieldError('StoreAuthToken', 'token');
    }
  }

  @override
  StoreAuthToken rebuild(void Function(StoreAuthTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreAuthTokenBuilder toBuilder() =>
      new StoreAuthTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreAuthToken && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, token.hashCode));
  }
}

class StoreAuthTokenBuilder
    implements Builder<StoreAuthToken, StoreAuthTokenBuilder> {
  _$StoreAuthToken _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  StoreAuthTokenBuilder();

  StoreAuthTokenBuilder get _$this {
    if (_$v != null) {
      _token = _$v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreAuthToken other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StoreAuthToken;
  }

  @override
  void update(void Function(StoreAuthTokenBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreAuthToken build() {
    final _$result = _$v ?? new _$StoreAuthToken._(token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
