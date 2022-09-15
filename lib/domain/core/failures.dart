import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/album/album_value_failure.dart';
import 'package:hiring_task/domain/comment/comment_value_failure.dart';
import 'package:hiring_task/domain/photo/photo_value_failure.dart';
import 'package:hiring_task/domain/post/post_value_failure.dart';
import 'package:hiring_task/domain/user/user_value_failure.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure<T> with _$Failure<T> {
  const factory Failure.user(UserValueFailure<T> failure) = _User<T>;

  const factory Failure.post(PostValueFailure<T> failure) = _Post<T>;

  const factory Failure.comment(CommentValueFailure<T> failure) = _Comment<T>;

  const factory Failure.album(AlbumValueFailure<T> failure) = _Album<T>;

  const factory Failure.photo(PhotoValueFailure<T> failure) = _Photo<T>;
}
