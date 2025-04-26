import 'package:book_app/Features/books/domain/entities/author.dart';

class AuthorModel extends Author {
  const AuthorModel({required super.name});

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
