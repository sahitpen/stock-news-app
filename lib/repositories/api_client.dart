import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

abstract class ApiClient {
  final String baseUrl;
  final Map<String, dynamic> queryParameters = {};
  final Dio httpClient;

  ApiClient({
    @required this.baseUrl,
    @required this.httpClient,
  })  : assert(baseUrl != null),
        assert(httpClient != null);

  Future<bool> authenticate();
}
