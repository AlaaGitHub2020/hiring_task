import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_value_failure.freezed.dart';

@freezed
abstract class CommentValueFailure<T> with _$CommentValueFailure<T> {
  const factory CommentValueFailure.commentNameNotCorrect({
    required T failedValue,
  }) = CommentNameNotCorrect<T>;

  const factory CommentValueFailure.commentEmailNotCorrect({
    required T failedValue,
  }) = CommentEmailNotCorrect<T>;

  const factory CommentValueFailure.commentBodyNotCorrect({
    required T failedValue,
  }) = CommentBodyNotCorrect<T>;
}
