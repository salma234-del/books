import 'package:book_app/Core/network/remote/dio_client.dart';
import 'package:book_app/Core/services/api_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

// This is the service locator instance
// It is used to register and retrieve dependencies

void setupServiceLocator() {
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => ApiService(sl<DioClient>().dio));
}
