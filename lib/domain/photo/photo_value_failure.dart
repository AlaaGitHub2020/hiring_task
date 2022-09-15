import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_value_failure.freezed.dart';

@freezed
abstract class PhotoValueFailure<T> with _$PhotoValueFailure<T> {
  const factory PhotoValueFailure.titleNotCorrect({
    required T failedValue,
  }) = TitleNotCorrect<T>;

  const factory PhotoValueFailure.photoUrlNotCorrect({
    required T failedValue,
  }) = PhotoUrlNotCorrect<T>;

  const factory PhotoValueFailure.thumbnailUrlNotCorrect({
    required T failedValue,
  }) = ThumbnailUrlNotCorrect<T>;
}
