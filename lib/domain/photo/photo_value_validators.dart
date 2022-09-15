import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/photo/photo_value_failure.dart';

Either<Failure<String?>, String?> validateTitle(String? input) {
  if (input == null) {
    return left(
        Failure.photo(PhotoValueFailure.titleNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validatePhotoUrl(String? input) {
  if (input == null) {
    return left(Failure.photo(
        PhotoValueFailure.photoUrlNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}

Either<Failure<String?>, String?> validateThumbnailUrl(String? input) {
  if (input == null) {
    return left(Failure.photo(
        PhotoValueFailure.thumbnailUrlNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}
