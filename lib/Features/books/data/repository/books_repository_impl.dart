import 'package:book_app/Core/error/failures/failure.dart';
import 'package:book_app/Core/error/failures/server_failure.dart';
import 'package:book_app/Features/books/data/datasource/base_books_remote_datasource.dart';
import 'package:book_app/Features/books/domain/entities/get_books_response.dart';
import 'package:book_app/Features/books/domain/repository/base_books_repository.dart';
import 'package:dartz/dartz.dart';

class BooksRepositoryImpl implements BaseBooksRepository {
  final BaseBooksRemoteDatasource baseBooksRemoteDatasource;
  BooksRepositoryImpl(this.baseBooksRemoteDatasource);
  // This method is used to get the books from the API
  // It uses the BaseBooksRemoteDatasource to make the API call

  @override
  Future<Either<Failure, GetBooksResponse>> getBooks(int page) async {
    try {
      final result = await baseBooksRemoteDatasource.getBooks(page);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
