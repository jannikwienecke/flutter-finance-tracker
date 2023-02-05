import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/app/shared/domain/failures.dart';

abstract class ValueObject<T> extends Equatable {
  const ValueObject();

  @override
  List<Object?> get props => [];

  Either<ValueFailure<T>, T> get value;
}
