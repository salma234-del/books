import 'package:book_app/Features/books/data/models/get_books_response_model.dart';
import 'package:book_app/Features/books/domain/usecases/get_books_usecase.dart';

abstract class BaseBooksRemoteDatasource {
  Future<GetBooksResponseModel> getBooks(GetBooksUsecaseParams params);
}
