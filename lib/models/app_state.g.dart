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
    if (object.user != null) {
      result
        ..add('user')
        ..add(serializers.serialize(object.user,
            specifiedType: const FullType(User)));
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
        case 'user':
          result.user.replace(serializers.deserialize(value,
              specifiedType: const FullType(User)) as User);
          break;
        case 'problems':
          result.problems.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Problem)]))
              as BuiltList<dynamic>);
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
  final User user;
  @override
  final BuiltList<Problem> problems;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.authStep, this.user, this.problems}) : super._() {
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
        user == other.user &&
        problems == other.problems;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, authStep.hashCode), user.hashCode), problems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('authStep', authStep)
          ..add('user', user)
          ..add('problems', problems))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  int _authStep;
  int get authStep => _$this._authStep;
  set authStep(int authStep) => _$this._authStep = authStep;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  ListBuilder<Problem> _problems;
  ListBuilder<Problem> get problems =>
      _$this._problems ??= new ListBuilder<Problem>();
  set problems(ListBuilder<Problem> problems) => _$this._problems = problems;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _authStep = _$v.authStep;
      _user = _$v.user?.toBuilder();
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
              user: _user?.build(),
              problems: problems.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
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
