import 'package:book_app/Features/books/data/models/book_model.dart';

abstract class BaseBooksLocalDatasource {
  Future<void> cacheBooks(List<BookModel> books, String cacheKey);
  Future<List<BookModel>> getCachedBooks(String cacheKey);
}
