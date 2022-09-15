import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_value_failure.freezed.dart';

@freezed
abstract class CommentValueFailure<T> with _$CommentValueFailure<T> {
  const factory CommentValueFailure.commentNameNotCorrect({
    required T failedValue,
    required int minNameLength,
    required int maxNameLength,
  }) = CommentNameNotCorrect<T>;

  const factory CommentValueFailure.commentEmailNotCorrect({
    required T failedValue,
  }) = CommentEmailNotCorrect<T>;

  const factory CommentValueFailure.commentBodyNotCorrect({
    required T failedValue,
    required int minNameLength,
    required int maxNameLength,
  }) = CommentBodyNotCorrect<T>;

  const factory CommentValueFailure.required({
    required T failedValue,
  }) = Required<T>;
}
