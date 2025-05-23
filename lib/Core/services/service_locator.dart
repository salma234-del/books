import 'package:book_app/Core/network/local/cache_helper.dart';
import 'package:book_app/Core/network/remote/dio_client.dart';
import 'package:book_app/Core/services/api_service.dart';
import 'package:book_app/Features/books/data/datasource/local/base_books_local_datasorce.dart';
import 'package:book_app/Features/books/data/datasource/local/books_local_datasource.dart';
import 'package:book_app/Features/books/data/datasource/remote/base_books_remote_datasource.dart';
import 'package:book_app/Features/books/data/datasource/remote/books_remote_datasource.dart';
import 'package:book_app/Features/books/data/repository/books_repository_impl.dart';
import 'package:book_app/Features/books/domain/repository/base_books_repository.dart';
import 'package:book_app/Features/books/domain/usecases/get_books_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

// This is the service locator instance
// It is used to register and retrieve dependencies

void setupServiceLocator() {
  sl.registerLazySingleton(() => DioClient());
  sl.registerLazySingleton(() => ApiService(sl<DioClient>().dio));
  sl.registerLazySingleton(() => CacheHelper());
  // remote data sources
  sl.registerLazySingleton<BaseBooksRemoteDatasource>(
      () => BooksRemoteDatasource(sl<ApiService>()));
  // local data sources

  sl.registerLazySingleton<BaseBooksLocalDatasource>(
      () => BooksLocalDatasource(sl<CacheHelper>()));
  // repositories
  sl.registerLazySingleton<BaseBooksRepository>(() => BooksRepositoryImpl(
      sl<BaseBooksRemoteDatasource>(), sl<BaseBooksLocalDatasource>()));
  // use cases
  sl.registerLazySingleton(() => GetBooksUsecase(sl<BaseBooksRepository>()));
}
