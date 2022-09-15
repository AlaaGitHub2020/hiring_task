import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/core/entity.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/post/value_objects.dart';

part 'post.freezed.dart';

@freezed
abstract class Post with _$Post implements IEntity {
  const factory Post({
    UniqueId? userId,
    UniqueId? id,
    Title? title,
    Body? body,
  }) = _Post;

  factory Post.empty() => Post(
        userId: UniqueId(0),
        id: UniqueId(0),
        title: Title(''),
        body: Body(''),
      );
}
