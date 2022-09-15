import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/album/album_value_failure.dart';
import 'package:hiring_task/domain/core/failures.dart';

Either<Failure<String?>, String?> validateTitle(String? input) {
  if (input == null) {
    return left(Failure.album(
        AlbumValueFailure.albumTitleNotCorrect(failedValue: input)));
  } else {
    return right(input);
  }
}
