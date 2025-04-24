import 'package:equatable/equatable.dart';

// Equatable package will help us to compare the objects
// and check if they are equal or not
// This is useful for the cubut to check if the state has changed or not
// and emit the new state if it has changed

class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}
