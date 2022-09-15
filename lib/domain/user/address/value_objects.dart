import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/user/address/address_value_validators.dart';

class Street extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Street(String? input) {
    return Street._(
      validateStreet(input),
    );
  }

  const Street._(this.value);
}

class Suite extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Suite(String? input) {
    return Suite._(
      validateSuite(input),
    );
  }

  const Suite._(this.value);
}

class City extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory City(String? input) {
    return City._(
      validateCity(input),
    );
  }

  const City._(this.value);
}

class Zipcode extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Zipcode(String? input) {
    return Zipcode._(
      validateZipcode(input),
    );
  }

  const Zipcode._(this.value);
}
