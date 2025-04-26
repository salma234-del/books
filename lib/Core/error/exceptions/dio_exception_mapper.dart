import 'package:book_app/Core/error/failures/server_failure.dart';
import 'package:book_app/Core/utils/app_strings.dart';
import 'package:dio/dio.dart';

class DioExceptionMapper {
  static ServerFailure fromDioError(DioException dioError) {   
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: AppStrings.timeout);
      case DioExceptionType.connectionError:
        return ServerFailure(message: AppStrings.noInternet);
      case DioExceptionType.badResponse:
        final code = dioError.response?.statusCode ?? 0;
        return ServerFailure.fromCode(code);

      case DioExceptionType.cancel:
        return ServerFailure(message: AppStrings.cancelled);

      case DioExceptionType.unknown:
        return ServerFailure(message: AppStrings.unknownError);

      default:
        return ServerFailure(message: AppStrings.unknownError);
    }
  }
}
