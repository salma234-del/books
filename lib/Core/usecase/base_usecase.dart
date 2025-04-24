import 'package:book_app/Core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUsecase<T, Params> {
  Future<Either<Failure, T>> call([Params? params]);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
