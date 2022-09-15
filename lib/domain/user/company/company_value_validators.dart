import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/user/user_value_failure.dart';

Either<Failure<String?>, String?> validateName(String? input) {
  if (input == null) {
    return left(Failure.user(
        UserValueFailure.companyNameNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateCatchPhrase(String? input) {
  if (input == null) {
    return left(Failure.user(
        UserValueFailure.companyCatchPhraseNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateBs(String? input) {
  if (input == null) {
    return left(
        Failure.user(UserValueFailure.companyBsNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}
