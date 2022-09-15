import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/user/user_value_failure.dart';

Either<Failure<String?>, String?> validateName(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.nameNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateUsername(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.usernameNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateEmail(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.emailNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validatePhone(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.phoneNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateWebsite(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.websiteNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}
