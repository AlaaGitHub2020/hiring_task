import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/comment/comment_value_failure.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/core/utilities/strings.dart';
import 'package:hiring_task/generated/l10n.dart';

Either<Failure<String?>, String?> validateName(
    String? input, int maxNameLength, int minNameLength) {
  if (input == null || input.isEmpty) {
    return left(
      Failure.comment(
        CommentValueFailure.required(
          failedValue: S.current.required,
        ),
      ),
    );
  } else {
    if (input.length >= minNameLength && input.length <= maxNameLength) {
      return right(input);
    } else {
      return left(
        Failure.comment(
          CommentValueFailure.commentNameNotCorrect(
            failedValue: S.current.nameShouldBe(minNameLength, maxNameLength),
            minNameLength: minNameLength,
            maxNameLength: maxNameLength,
          ),
        ),
      );
    }
  }
}

Either<Failure<String?>, String?> validateEmail(String? input) {
  if (input == null || input.isEmpty) {
    return left(
      Failure.comment(
        CommentValueFailure.required(
          failedValue: S.current.required,
        ),
      ),
    );
  } else {
    if (RegExp(Strings.pEmailPattern).hasMatch(input.trim())) {
      return right(input);
    } else {
      return left(
        Failure.comment(
            CommentValueFailure.commentEmailNotCorrect(failedValue: input)),
      );
    }
  }
}

Either<Failure<String?>, String?> validateBody(
    String? input, int maxNameLength, int minNameLength) {
  if (input == null || input.isEmpty) {
    return left(
      Failure.comment(
        CommentValueFailure.required(
          failedValue: S.current.required,
        ),
      ),
    );
  } else {
    if (input.length >= minNameLength && input.length <= maxNameLength) {
      return right(input);
    } else {
      return left(
        Failure.comment(
          CommentValueFailure.commentBodyNotCorrect(
            failedValue:
                S.current.commentBodyShouldBe(minNameLength, maxNameLength),
            minNameLength: minNameLength,
            maxNameLength: maxNameLength,
          ),
        ),
      );
    }
  }
}
