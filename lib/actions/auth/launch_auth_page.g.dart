// GENERATED CODE - DO NOT MODIFY BY HAND

part of launch_auth_page;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LaunchAuthPage> _$launchAuthPageSerializer =
    new _$LaunchAuthPageSerializer();

class _$LaunchAuthPageSerializer
    implements StructuredSerializer<LaunchAuthPage> {
  @override
  final Iterable<Type> types = const [LaunchAuthPage, _$LaunchAuthPage];
  @override
  final String wireName = 'LaunchAuthPage';

  @override
  Iterable<Object> serialize(Serializers serializers, LaunchAuthPage object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  LaunchAuthPage deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new LaunchAuthPageBuilder().build();
  }
}

class _$LaunchAuthPage extends LaunchAuthPage {
  factory _$LaunchAuthPage([void Function(LaunchAuthPageBuilder) updates]) =>
      (new LaunchAuthPageBuilder()..update(updates)).build();

  _$LaunchAuthPage._() : super._();

  @override
  LaunchAuthPage rebuild(void Function(LaunchAuthPageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LaunchAuthPageBuilder toBuilder() =>
      new LaunchAuthPageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LaunchAuthPage;
  }

  @override
  int get hashCode {
    return 546357824;
  }
}

class LaunchAuthPageBuilder
    implements Builder<LaunchAuthPage, LaunchAuthPageBuilder> {
  _$LaunchAuthPage _$v;

  LaunchAuthPageBuilder();

  @override
  void replace(LaunchAuthPage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LaunchAuthPage;
  }

  @override
  void update(void Function(LaunchAuthPageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LaunchAuthPage build() {
    final _$result = _$v ?? new _$LaunchAuthPage._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
