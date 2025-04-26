import 'package:book_app/Core/error/exceptions/dio_exception_mapper.dart';
import 'package:book_app/Core/error/exceptions/server_exception.dart';
import 'package:book_app/Core/network/remote/error_message_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get(
        endPoint,
        queryParameters: params,
      );
      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic data,
  }) async {
    try {
      final response = await _dio.post(endPoint, data: data);
      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> patch({
    required String endPoint,
    required dynamic data,
  }) async {
    try {
      final response = await _dio.patch(endPoint, data: data);
      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    try {
      final response = await _dio.delete(endPoint);
      return Map<String, dynamic>.from(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  ServerException _handleDioError(DioException e) {
    // Will return the error body if exists and is in the expected format
    if (e.response != null && e.response?.data is Map<String, dynamic>) {
      try {
        // If response body exists, parse and return server exception
        return ServerException(
            ErrorMessageModel.fromJson(e.response!.data).errorMessage);
      } catch (_) {
        // In case there's an issue parsing the response body, return the raw response
        return ServerException(e.response?.data);
      }
    }

    // Handle the case when there is no response body or it's not in the expected format
    final serverFailure = DioExceptionMapper.fromDioError(e);

    // Map the failure to a ServerException (using ServerFailure message)
    return ServerException(serverFailure.message);
  }
}
