import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/comment/comment_value_validators.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/core/value_objects.dart';

class Name extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Name(String? input) {
    return Name._(
      validateName(input),
    );
  }

  const Name._(this.value);
}

class Email extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Email(String? input) {
    return Email._(
      validateEmail(input),
    );
  }

  const Email._(this.value);
}

class Body extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Body(String? input) {
    return Body._(
      validateBody(input),
    );
  }

  const Body._(this.value);
}
