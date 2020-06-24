import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';

class MockDio extends Mock implements Dio {}

class FakeDio extends Fake implements Dio {
  FakeDio({@required this.response});
  String response;
  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) =>
      Future.value(Response(data: json.decode(response) as T));
}
