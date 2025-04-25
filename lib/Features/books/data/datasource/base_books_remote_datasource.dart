import 'package:book_app/Features/books/data/models/get_books_response_model.dart';

abstract class BaseBooksRemoteDatasource {
  Future<GetBooksResponseModel> getBooks(int page);
}
