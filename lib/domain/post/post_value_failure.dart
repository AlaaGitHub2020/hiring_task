import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_value_failure.freezed.dart';

@freezed
abstract class PostValueFailure<T> with _$PostValueFailure<T> {
  const factory PostValueFailure.titleNotCorrect({
    required T failedValue,
  }) = TitleNotCorrect<T>;

  const factory PostValueFailure.bodyNotCorrect({
    required T failedValue,
  }) = BodyNotCorrect<T>;
}
