import 'package:book_app/Core/error/failures/failure.dart';
import 'package:book_app/Features/books/domain/entities/get_books_response.dart';
import 'package:book_app/Features/books/domain/usecases/get_books_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseBooksRepository {
  Future<Either<Failure, GetBooksResponse>> getBooks(
    GetBooksUsecaseParams params,
  );
}
