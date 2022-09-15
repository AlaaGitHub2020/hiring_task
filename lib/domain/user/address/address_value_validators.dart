import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/user/user_value_failure.dart';

Either<Failure<String?>, String?> validateStreet(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.streetNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateSuite(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.suiteNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateCity(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.cityNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateZipcode(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.zipcodeNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}
