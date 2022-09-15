import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/post/post_value_failure.dart';

Either<Failure<String?>, String?> validateTitle(String? input) {
  if (input == null) {
    return left(
        Failure.post(PostValueFailure.titleNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateBody(String? input) {
  if (input == null) {
    return left(
        Failure.post(PostValueFailure.bodyNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}
