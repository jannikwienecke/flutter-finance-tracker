import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:notes/app/shared/domain/ValueObject.dart';
import 'package:notes/app/shared/domain/failures.dart';

@immutable
class EmailProps {
  const EmailProps({
    required this.name,
  });

  final String name;
}

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }
  const EmailAddress._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(input));
  }
}
