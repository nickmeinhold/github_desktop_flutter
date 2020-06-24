// GENERATED CODE - DO NOT MODIFY BY HAND

part of add_problem;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddProblem> _$addProblemSerializer = new _$AddProblemSerializer();

class _$AddProblemSerializer implements StructuredSerializer<AddProblem> {
  @override
  final Iterable<Type> types = const [AddProblem, _$AddProblem];
  @override
  final String wireName = 'AddProblem';

  @override
  Iterable<Object> serialize(Serializers serializers, AddProblem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'problem',
      serializers.serialize(object.problem,
          specifiedType: const FullType(Problem)),
    ];

    return result;
  }

  @override
  AddProblem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddProblemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'problem':
          result.problem.replace(serializers.deserialize(value,
              specifiedType: const FullType(Problem)) as Problem);
          break;
      }
    }

    return result.build();
  }
}

class _$AddProblem extends AddProblem {
  @override
  final Problem problem;

  factory _$AddProblem([void Function(AddProblemBuilder) updates]) =>
      (new AddProblemBuilder()..update(updates)).build();

  _$AddProblem._({this.problem}) : super._() {
    if (problem == null) {
      throw new BuiltValueNullFieldError('AddProblem', 'problem');
    }
  }

  @override
  AddProblem rebuild(void Function(AddProblemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddProblemBuilder toBuilder() => new AddProblemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddProblem && problem == other.problem;
  }

  @override
  int get hashCode {
    return $jf($jc(0, problem.hashCode));
  }
}

class AddProblemBuilder implements Builder<AddProblem, AddProblemBuilder> {
  _$AddProblem _$v;

  ProblemBuilder _problem;
  ProblemBuilder get problem => _$this._problem ??= new ProblemBuilder();
  set problem(ProblemBuilder problem) => _$this._problem = problem;

  AddProblemBuilder();

  AddProblemBuilder get _$this {
    if (_$v != null) {
      _problem = _$v.problem?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddProblem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AddProblem;
  }

  @override
  void update(void Function(AddProblemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AddProblem build() {
    _$AddProblem _$result;
    try {
      _$result = _$v ?? new _$AddProblem._(problem: problem.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'problem';
        problem.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AddProblem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
