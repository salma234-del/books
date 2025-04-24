import 'package:book_app/Core/services/api_service.dart';
import 'package:book_app/Core/services/service_locator.dart';
import 'package:book_app/Features/books/data/datasource/books_remote_datasource.dart';
import 'package:book_app/Features/books/data/repository/books_repository_impl.dart';
import 'package:book_app/Features/books/domain/usecases/get_books_usecase.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  // Instantiate the GetBooksUsecase with the necessary dependencies
  GetBooksUsecase getBooksUsecase = GetBooksUsecase(
    BooksRepositoryImpl(
      BooksRemoteDatasource(ApiService()),
    ),
  );

  // Call the use case and print the result

  final books = await getBooksUsecase.call();
  books.fold(
    (failure) => debugPrint(failure.message),
    (books) => debugPrint('Books: $books'),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Text('salma'),
    );
  }
}
