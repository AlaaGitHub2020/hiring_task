import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/user/company/company_value_validators.dart';

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

class CatchPhrase extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory CatchPhrase(String? input) {
    return CatchPhrase._(
      validateCatchPhrase(input),
    );
  }

  const CatchPhrase._(this.value);
}

class Bs extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Bs(String? input) {
    return Bs._(
      validateBs(input),
    );
  }

  const Bs._(this.value);
}
