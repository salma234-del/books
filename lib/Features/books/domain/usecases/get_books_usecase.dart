import 'package:book_app/Core/error/failures/failure.dart';
import 'package:book_app/Core/usecase/base_usecase.dart';
import 'package:book_app/Features/books/domain/entities/get_books_response.dart';
import 'package:book_app/Features/books/domain/repository/base_books_repository.dart';
import 'package:dartz/dartz.dart';

class GetBooksUsecase extends BaseUsecase<GetBooksResponse, int> {
  final BaseBooksRepository baseBooksRepository;

  GetBooksUsecase(this.baseBooksRepository);

  @override
  Future<Either<Failure, GetBooksResponse>> call([int? params]) async {
    return await baseBooksRepository.getBooks(params ?? 1);
  }
}
