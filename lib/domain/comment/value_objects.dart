import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/comment/comment_value_validators.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/core/value_objects.dart';

class Name extends ValueObject<String?> {
  static const int maxNameLength = 700;
  static const int minNameLength = 1;
  @override
  final Either<Failure<String?>, String?> value;

  factory Name(String? input) {
    return Name._(
      validateName(input, maxNameLength, minNameLength),
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
  static const int maxNameLength = 5000;
  static const int minNameLength = 1;
  @override
  final Either<Failure<String?>, String?> value;

  factory Body(String? input) {
    return Body._(
      validateBody(input, maxNameLength, minNameLength),
    );
  }

  const Body._(this.value);
}
