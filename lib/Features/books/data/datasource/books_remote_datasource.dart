import 'package:book_app/Core/network/remote/api_constants.dart';
import 'package:book_app/Core/services/api_service.dart';
import 'package:book_app/Features/books/data/datasource/base_books_remote_datasource.dart';
import 'package:book_app/Features/books/data/models/book_model.dart';

class BooksRemoteDatasource implements BaseBooksRemoteDatasource {
  final ApiService apiService;
  BooksRemoteDatasource(this.apiService);
  // This method is used to get the books from the API
  // It uses the ApiService to make the API call
  @override
  Future<List<BookModel>> getBooks() async {
    final response =
        await apiService.get(endPoint: ApiConstants.kBooksEndPoint);
    // The response is a list of books
    // We need to convert it to a list of BookModel
    List<BookModel> books = List.from(response['results'] as List)
        .map((book) => BookModel.fromJson(book))
        .toList();

    return books;
  }
}
