import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/user/user_value_failure.dart';

Either<Failure<String?>, String?> validateLatitude(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.latitudeNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateLongitude(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.longitudeNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}
