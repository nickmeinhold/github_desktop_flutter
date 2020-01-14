// GENERATED CODE - DO NOT MODIFY BY HAND

part of user;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<User> _$userSerializer = new _$UserSerializer();

class _$UserSerializer implements StructuredSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];
  @override
  final String wireName = 'User';

  @override
  Iterable<Object> serialize(Serializers serializers, User object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'uid',
      serializers.serialize(object.uid, specifiedType: const FullType(String)),
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
      'photoUrl',
      serializers.serialize(object.photoUrl,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'providers',
      serializers.serialize(object.providers,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ProviderInfo)])),
    ];

    return result;
  }

  @override
  User deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photoUrl':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'providers':
          result.providers.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ProviderInfo)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$User extends User {
  @override
  final String uid;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String email;
  @override
  final BuiltList<ProviderInfo> providers;

  factory _$User([void Function(UserBuilder) updates]) =>
      (new UserBuilder()..update(updates)).build();

  _$User._(
      {this.uid, this.displayName, this.photoUrl, this.email, this.providers})
      : super._() {
    if (uid == null) {
      throw new BuiltValueNullFieldError('User', 'uid');
    }
    if (displayName == null) {
      throw new BuiltValueNullFieldError('User', 'displayName');
    }
    if (photoUrl == null) {
      throw new BuiltValueNullFieldError('User', 'photoUrl');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('User', 'email');
    }
    if (providers == null) {
      throw new BuiltValueNullFieldError('User', 'providers');
    }
  }

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        uid == other.uid &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        email == other.email &&
        providers == other.providers;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, uid.hashCode), displayName.hashCode),
                photoUrl.hashCode),
            email.hashCode),
        providers.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('User')
          ..add('uid', uid)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('email', email)
          ..add('providers', providers))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User _$v;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  ListBuilder<ProviderInfo> _providers;
  ListBuilder<ProviderInfo> get providers =>
      _$this._providers ??= new ListBuilder<ProviderInfo>();
  set providers(ListBuilder<ProviderInfo> providers) =>
      _$this._providers = providers;

  UserBuilder();

  UserBuilder get _$this {
    if (_$v != null) {
      _uid = _$v.uid;
      _displayName = _$v.displayName;
      _photoUrl = _$v.photoUrl;
      _email = _$v.email;
      _providers = _$v.providers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$User build() {
    _$User _$result;
    try {
      _$result = _$v ??
          new _$User._(
              uid: uid,
              displayName: displayName,
              photoUrl: photoUrl,
              email: email,
              providers: providers.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'providers';
        providers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'User', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
