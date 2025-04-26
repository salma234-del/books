import 'package:book_app/Core/error/failures/failure.dart';
import 'package:book_app/Core/error/failures/server_failure.dart';
import 'package:book_app/Features/books/data/datasource/local/base_books_local_datasorce.dart';
import 'package:book_app/Features/books/data/datasource/remote/base_books_remote_datasource.dart';
import 'package:book_app/Features/books/data/models/book_model.dart';
import 'package:book_app/Features/books/domain/entities/get_books_response.dart';
import 'package:book_app/Features/books/domain/repository/base_books_repository.dart';
import 'package:book_app/Features/books/domain/usecases/get_books_usecase.dart';
import 'package:dartz/dartz.dart';

class BooksRepositoryImpl implements BaseBooksRepository {
  final BaseBooksRemoteDatasource baseBooksRemoteDatasource;
  final BaseBooksLocalDatasource baseBooksLocalDatasource;

  BooksRepositoryImpl(
      this.baseBooksRemoteDatasource, this.baseBooksLocalDatasource);

  @override
  Future<Either<Failure, GetBooksResponse>> getBooks(
      GetBooksUsecaseParams params) async {
    try {
      // Fetch books from the remote API

      final result = await baseBooksRemoteDatasource.getBooks(params);
      // Convert the List<Book> to List<BookModel> for caching
      final booksToCache =
          result.books.map((book) => BookModel.fromBook(book)).toList();
      // Cache the fetched books
      await baseBooksLocalDatasource.cacheBooks(
          booksToCache, params.query ?? '');
      return Right(result);
    } catch (e) {
      final cachedBooks =
          await baseBooksLocalDatasource.getCachedBooks(params.query ?? '');
      if (cachedBooks.isNotEmpty) {
        // If an error occurs, return the cached books
        return Right(GetBooksResponse(
          count: cachedBooks.length,
          books: cachedBooks,
          next: null,
          previous: null,
        ));
      }

      return Left(ServerFailure(message: e.toString()));
    }
  }
}
