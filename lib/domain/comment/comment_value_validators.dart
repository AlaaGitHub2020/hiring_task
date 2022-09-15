import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/comment/comment_value_failure.dart';
import 'package:hiring_task/domain/core/failures.dart';

Either<Failure<String?>, String?> validateName(String? input) {
  if (input == null) {
    return left(Failure.comment(
        CommentValueFailure.commentNameNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateEmail(String? input) {
  if (input == null) {
    return left(Failure.comment(
        CommentValueFailure.commentEmailNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateBody(String? input) {
  if (input == null) {
    return left(Failure.comment(
        CommentValueFailure.commentBodyNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}
