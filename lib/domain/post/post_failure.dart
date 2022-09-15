import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_failure.freezed.dart';

@freezed
abstract class PostsFailure with _$PostsFailure {
  const factory PostsFailure.unexpected() = _Unexpected;

  const factory PostsFailure.fetchPostsListFailure() = _FetchPostsListFailure;

  const factory PostsFailure.getPostDetailsFailure() = _GetPostDetailsFailure;
}
