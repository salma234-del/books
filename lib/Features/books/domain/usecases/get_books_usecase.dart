import 'package:book_app/Core/error/failures/failure.dart';
import 'package:book_app/Core/usecase/base_usecase.dart';
import 'package:book_app/Features/books/domain/entities/get_books_response.dart';
import 'package:book_app/Features/books/domain/repository/base_books_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetBooksUsecase
    extends BaseUsecase<GetBooksResponse, GetBooksUsecaseParams> {
  final BaseBooksRepository baseBooksRepository;

  GetBooksUsecase(this.baseBooksRepository);

  @override
  Future<Either<Failure, GetBooksResponse>> call(
      [GetBooksUsecaseParams? params]) async {
    return await baseBooksRepository
        .getBooks(params ?? GetBooksUsecaseParams(page: 1));
  }
}

class GetBooksUsecaseParams extends Equatable {
  final int page;
  final String? query;

  const GetBooksUsecaseParams({required this.page, this.query});

  @override
  List<Object?> get props => [page, query];
}
