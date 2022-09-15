import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/user/user_value_validators.dart';

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

class Username extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Username(String? input) {
    return Username._(
      validateUsername(input),
    );
  }

  const Username._(this.value);
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

class Phone extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Phone(String? input) {
    return Phone._(
      validatePhone(input),
    );
  }

  const Phone._(this.value);
}

class Website extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Website(String? input) {
    return Website._(
      validateWebsite(input),
    );
  }

  const Website._(this.value);
}
