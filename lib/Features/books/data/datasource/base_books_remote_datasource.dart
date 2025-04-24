import 'package:book_app/Features/books/data/models/book_model.dart';

abstract class BaseBooksRemoteDatasource {
  Future<List<BookModel>> getBooks();
}
