import 'package:dartz/dartz.dart';
import 'package:notes/app/shared/domain/ValueObject.dart';
import 'package:notes/app/shared/domain/failures.dart';

class UsernameProps {
  UsernameProps({
    required this.name,
  });

  final String name;
}

class Username extends ValueObject<String> {
  const Username(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}
