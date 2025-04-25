import 'package:book_app/Core/network/remote/api_constants.dart';
import 'package:book_app/Core/services/api_service.dart';
import 'package:book_app/Features/books/data/datasource/base_books_remote_datasource.dart';
import 'package:book_app/Features/books/data/models/get_books_response_model.dart';

class BooksRemoteDatasource implements BaseBooksRemoteDatasource {
  final ApiService apiService;
  BooksRemoteDatasource(this.apiService);
  // This method is used to get the get books response from the API
  // It uses the ApiService to make the API call
  @override
  Future<GetBooksResponseModel> getBooks(int page) async {
    final response = await apiService.get(
      endPoint: ApiConstants.kBooksEndPoint,
      params: {
        ApiConstants.kPageKey: page,
      },
    );

    return GetBooksResponseModel.fromJson(response);
  }
}
