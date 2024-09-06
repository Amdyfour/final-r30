
import 'package:commerce/core/api/api_consumer.dart';
import 'package:commerce/core/api/api_interceptors.dart';
import 'package:commerce/core/api/end_points.dart';
import 'package:commerce/core/api/exceptions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  late final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseurl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }
  @override
  Future dalete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isformdata = false}) async {
    try {
      final response = await dio.delete(path,
          data: isformdata ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isformdata = false}) async {
    try {
      final response = await dio.patch(path,
          data: isformdata ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isformdata = false}) async {
    try {
      final response = await dio.post(path,
          data: isformdata ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}

void main () {
  DioConsumer dioConsumer = DioConsumer(dio: Dio());

  dioConsumer.get(EndPoints.carts).then((data)=> print(data));

}