import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String name;

  const Author({required this.name});

  @override
  List<Object?> get props => [name];
}
