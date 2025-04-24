import 'package:book_app/Core/error/failures/failure.dart';
import 'package:book_app/Core/utils/app_strings.dart';

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  // Factory constructor to create a ServerFailure instance based on the error code
  factory ServerFailure.fromCode(int code) {
    switch (code) {
      case 500:
        return ServerFailure(message: AppStrings.serverUnavailable);
      case 401:
        return ServerFailure(message: AppStrings.unauthorized);
      case 404:
        return ServerFailure(message: AppStrings.notFound);
      case 400:
        return ServerFailure(message: AppStrings.badRequest);
      default:
        return ServerFailure(message: AppStrings.unknownError);
    }
  }
}
