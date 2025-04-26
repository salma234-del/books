import 'package:book_app/Core/network/local/cache_helper.dart';
import 'package:book_app/Features/books/data/datasource/local/base_books_local_datasorce.dart';
import 'package:book_app/Features/books/data/models/book_model.dart';

class BooksLocalDatasource implements BaseBooksLocalDatasource {
  final CacheHelper cacheHelper;
  BooksLocalDatasource(this.cacheHelper);

  @override
  Future<void> cacheBooks(List<BookModel> books, String cacheKey) async {
    final booksJson = books.map((book) => book.toJson()).toList();
    await cacheHelper.saveList(cacheKey, booksJson);
  }

  @override
  Future<List<BookModel>> getCachedBooks(String cacheKey) async {
    final cachedData = await cacheHelper.getList(cacheKey);
    if (cachedData.isEmpty) {
      return [];
    }
    return cachedData.map((json) => BookModel.fromJson(json)).toList();
  }
}
