// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable<Object> serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'authStep',
      serializers.serialize(object.authStep,
          specifiedType: const FullType(int)),
      'problems',
      serializers.serialize(object.problems,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Problem)])),
    ];
    if (object.username != null) {
      result
        ..add('username')
        ..add(serializers.serialize(object.username,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
    if (object.authToken != null) {
      result
        ..add('authToken')
        ..add(serializers.serialize(object.authToken,
            specifiedType: const FullType(String)));
    }
    if (object.profile != null) {
      result
        ..add('profile')
        ..add(serializers.serialize(object.profile,
            specifiedType: const FullType(Profile)));
    }
    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'authStep':
          result.authStep = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'authToken':
          result.authToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'profile':
          result.profile.replace(serializers.deserialize(value,
              specifiedType: const FullType(Profile)) as Profile);
          break;
        case 'problems':
          result.problems.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Problem)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final int authStep;
  @override
  final String username;
  @override
  final String password;
  @override
  final String authToken;
  @override
  final Profile profile;
  @override
  final BuiltList<Problem> problems;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.authStep,
      this.username,
      this.password,
      this.authToken,
      this.profile,
      this.problems})
      : super._() {
    if (authStep == null) {
      throw new BuiltValueNullFieldError('AppState', 'authStep');
    }
    if (problems == null) {
      throw new BuiltValueNullFieldError('AppState', 'problems');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        authStep == other.authStep &&
        username == other.username &&
        password == other.password &&
        authToken == other.authToken &&
        profile == other.profile &&
        problems == other.problems;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, authStep.hashCode), username.hashCode),
                    password.hashCode),
                authToken.hashCode),
            profile.hashCode),
        problems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('authStep', authStep)
          ..add('username', username)
          ..add('password', password)
          ..add('authToken', authToken)
          ..add('profile', profile)
          ..add('problems', problems))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  int _authStep;
  int get authStep => _$this._authStep;
  set authStep(int authStep) => _$this._authStep = authStep;

  String _username;
  String get username => _$this._username;
  set username(String username) => _$this._username = username;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _authToken;
  String get authToken => _$this._authToken;
  set authToken(String authToken) => _$this._authToken = authToken;

  ProfileBuilder _profile;
  ProfileBuilder get profile => _$this._profile ??= new ProfileBuilder();
  set profile(ProfileBuilder profile) => _$this._profile = profile;

  ListBuilder<Problem> _problems;
  ListBuilder<Problem> get problems =>
      _$this._problems ??= new ListBuilder<Problem>();
  set problems(ListBuilder<Problem> problems) => _$this._problems = problems;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _authStep = _$v.authStep;
      _username = _$v.username;
      _password = _$v.password;
      _authToken = _$v.authToken;
      _profile = _$v.profile?.toBuilder();
      _problems = _$v.problems?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              authStep: authStep,
              username: username,
              password: password,
              authToken: authToken,
              profile: _profile?.build(),
              problems: problems.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'profile';
        _profile?.build();
        _$failedField = 'problems';
        problems.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
