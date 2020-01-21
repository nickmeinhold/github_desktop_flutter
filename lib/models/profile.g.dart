// GENERATED CODE - DO NOT MODIFY BY HAND

part of profile;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Profile> _$profileSerializer = new _$ProfileSerializer();

class _$ProfileSerializer implements StructuredSerializer<Profile> {
  @override
  final Iterable<Type> types = const [Profile, _$Profile];
  @override
  final String wireName = 'Profile';

  @override
  Iterable<Object> serialize(Serializers serializers, Profile object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'login',
      serializers.serialize(object.login,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'avatar_url',
      serializers.serialize(object.avatarUrl,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'location',
      serializers.serialize(object.location,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Profile deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'login':
          result.login = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'avatar_url':
          result.avatarUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Profile extends Profile {
  @override
  final String login;
  @override
  final int id;
  @override
  final String avatarUrl;
  @override
  final String email;
  @override
  final String name;
  @override
  final String location;

  factory _$Profile([void Function(ProfileBuilder) updates]) =>
      (new ProfileBuilder()..update(updates)).build();

  _$Profile._(
      {this.login,
      this.id,
      this.avatarUrl,
      this.email,
      this.name,
      this.location})
      : super._() {
    if (login == null) {
      throw new BuiltValueNullFieldError('Profile', 'login');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Profile', 'id');
    }
    if (avatarUrl == null) {
      throw new BuiltValueNullFieldError('Profile', 'avatarUrl');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('Profile', 'email');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Profile', 'name');
    }
    if (location == null) {
      throw new BuiltValueNullFieldError('Profile', 'location');
    }
  }

  @override
  Profile rebuild(void Function(ProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileBuilder toBuilder() => new ProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
        login == other.login &&
        id == other.id &&
        avatarUrl == other.avatarUrl &&
        email == other.email &&
        name == other.name &&
        location == other.location;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, login.hashCode), id.hashCode),
                    avatarUrl.hashCode),
                email.hashCode),
            name.hashCode),
        location.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Profile')
          ..add('login', login)
          ..add('id', id)
          ..add('avatarUrl', avatarUrl)
          ..add('email', email)
          ..add('name', name)
          ..add('location', location))
        .toString();
  }
}

class ProfileBuilder implements Builder<Profile, ProfileBuilder> {
  _$Profile _$v;

  String _login;
  String get login => _$this._login;
  set login(String login) => _$this._login = login;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _avatarUrl;
  String get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String avatarUrl) => _$this._avatarUrl = avatarUrl;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  ProfileBuilder();

  ProfileBuilder get _$this {
    if (_$v != null) {
      _login = _$v.login;
      _id = _$v.id;
      _avatarUrl = _$v.avatarUrl;
      _email = _$v.email;
      _name = _$v.name;
      _location = _$v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Profile other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Profile;
  }

  @override
  void update(void Function(ProfileBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Profile build() {
    final _$result = _$v ??
        new _$Profile._(
            login: login,
            id: id,
            avatarUrl: avatarUrl,
            email: email,
            name: name,
            location: location);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
