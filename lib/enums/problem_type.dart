import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:github_desktop_flutter/models/app/serializers.dart';

part 'problem_type.g.dart';

class ProblemType extends EnumClass {
  static Serializer<ProblemType> get serializer => _$problemTypeSerializer;

  static const ProblemType signIn = _$signIn;

  const ProblemType._(String name) : super(name);

  static BuiltSet<ProblemType> get values => _$values;
  static ProblemType valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(ProblemType.serializer, this);
}
