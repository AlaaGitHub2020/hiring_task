import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_failure.freezed.dart';

@freezed
abstract class CommentFailure with _$CommentFailure {
  const factory CommentFailure.unexpected() = _Unexpected;

  const factory CommentFailure.fetchCommentsListFailure() =
      _FetchCommentsListFailure;

  const factory CommentFailure.addNewCommentFailure() = _AddNewCommentFailure;

  const factory CommentFailure.requiredData() = _RequiredData;
}
