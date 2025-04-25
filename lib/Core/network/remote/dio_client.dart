// lib/Core/network/dio_client.dart

import 'package:dio/dio.dart';
import 'api_constants.dart';

class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: ApiConstants.kBaseUrl,
            headers: {
              'Content-Type': ApiConstants.kHeaderContentType,
            },
          ),
        ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) {
          // Optional: Token refresh or logging
          return handler.next(e);
        },
      ),
    );
  }
}
