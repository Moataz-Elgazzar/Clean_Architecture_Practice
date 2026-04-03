import 'package:clean_architecture_practice/core/service/dio/dio_endpoint.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(baseUrl: DioEndpoint.baseUrl, connectTimeout: const Duration(seconds: 5), receiveTimeout: const Duration(seconds: 5), sendTimeout: const Duration(seconds: 5), responseType: ResponseType.json, headers: const {'Content-Type': 'application/json', 'Accept': 'application/json'}));
  }

  static Future<Response> post({required String path, Object? data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    return await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> get({required String path, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    return await dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> put({required String path, Object? data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    return await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }

  static Future<Response> delete({required String path, Object? data, Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    return await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
  }
}
