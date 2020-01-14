// GENERATED CODE - DO NOT MODIFY BY HAND

part of problem;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProblemTypeEnum _$signin = const ProblemTypeEnum._('signin');
const ProblemTypeEnum _$checkin = const ProblemTypeEnum._('checkin');

ProblemTypeEnum _$valueOf(String name) {
  switch (name) {
    case 'signin':
      return _$signin;
    case 'checkin':
      return _$checkin;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ProblemTypeEnum> _$values =
    new BuiltSet<ProblemTypeEnum>(const <ProblemTypeEnum>[
  _$signin,
  _$checkin,
]);

Serializer<Problem> _$problemSerializer = new _$ProblemSerializer();
Serializer<ProblemTypeEnum> _$problemTypeEnumSerializer =
    new _$ProblemTypeEnumSerializer();

class _$ProblemSerializer implements StructuredSerializer<Problem> {
  @override
  final Iterable<Type> types = const [Problem, _$Problem];
  @override
  final String wireName = 'Problem';

  @override
  Iterable<Object> serialize(Serializers serializers, Problem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(ProblemTypeEnum)),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];
    if (object.trace != null) {
      result
        ..add('trace')
        ..add(serializers.serialize(object.trace,
            specifiedType: const FullType(String)));
    }
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(AppState)));
    }
    if (object.info != null) {
      result
        ..add('info')
        ..add(serializers.serialize(object.info,
            specifiedType: const FullType(
                Map, const [const FullType(String), const FullType(dynamic)])));
    }
    return result;
  }

  @override
  Problem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProblemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
                  specifiedType: const FullType(ProblemTypeEnum))
              as ProblemTypeEnum;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'trace':
          result.trace = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state.replace(serializers.deserialize(value,
              specifiedType: const FullType(AppState)) as AppState);
          break;
        case 'info':
          result.info = serializers.deserialize(value,
              specifiedType: const FullType(Map, const [
                const FullType(String),
                const FullType(dynamic)
              ])) as Map<String, dynamic>;
          break;
      }
    }

    return result.build();
  }
}

class _$ProblemTypeEnumSerializer
    implements PrimitiveSerializer<ProblemTypeEnum> {
  @override
  final Iterable<Type> types = const <Type>[ProblemTypeEnum];
  @override
  final String wireName = 'ProblemTypeEnum';

  @override
  Object serialize(Serializers serializers, ProblemTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ProblemTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProblemTypeEnum.valueOf(serialized as String);
}

class _$Problem extends Problem {
  @override
  final ProblemTypeEnum type;
  @override
  final String message;
  @override
  final String trace;
  @override
  final AppState state;
  @override
  final Map<String, dynamic> info;

  factory _$Problem([void Function(ProblemBuilder) updates]) =>
      (new ProblemBuilder()..update(updates)).build();

  _$Problem._({this.type, this.message, this.trace, this.state, this.info})
      : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('Problem', 'type');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('Problem', 'message');
    }
  }

  @override
  Problem rebuild(void Function(ProblemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProblemBuilder toBuilder() => new ProblemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Problem &&
        type == other.type &&
        message == other.message &&
        trace == other.trace &&
        state == other.state &&
        info == other.info;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, type.hashCode), message.hashCode), trace.hashCode),
            state.hashCode),
        info.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Problem')
          ..add('type', type)
          ..add('message', message)
          ..add('trace', trace)
          ..add('state', state)
          ..add('info', info))
        .toString();
  }
}

class ProblemBuilder implements Builder<Problem, ProblemBuilder> {
  _$Problem _$v;

  ProblemTypeEnum _type;
  ProblemTypeEnum get type => _$this._type;
  set type(ProblemTypeEnum type) => _$this._type = type;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  String _trace;
  String get trace => _$this._trace;
  set trace(String trace) => _$this._trace = trace;

  AppStateBuilder _state;
  AppStateBuilder get state => _$this._state ??= new AppStateBuilder();
  set state(AppStateBuilder state) => _$this._state = state;

  Map<String, dynamic> _info;
  Map<String, dynamic> get info => _$this._info;
  set info(Map<String, dynamic> info) => _$this._info = info;

  ProblemBuilder();

  ProblemBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _message = _$v.message;
      _trace = _$v.trace;
      _state = _$v.state?.toBuilder();
      _info = _$v.info;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Problem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Problem;
  }

  @override
  void update(void Function(ProblemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Problem build() {
    _$Problem _$result;
    try {
      _$result = _$v ??
          new _$Problem._(
              type: type,
              message: message,
              trace: trace,
              state: _state?.build(),
              info: info);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'state';
        _state?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Problem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
