import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/comment/value_objects.dart';
import 'package:hiring_task/domain/core/entity.dart';
import 'package:hiring_task/domain/core/value_objects.dart';

part 'comment.freezed.dart';

@freezed
abstract class Comment with _$Comment implements IEntity {
  const factory Comment({
    UniqueId? postId,
    UniqueId? id,
    Name? name,
    Email? email,
    Body? body,
  }) = _Comment;

  factory Comment.empty() => Comment(
        postId: UniqueId(0),
        id: UniqueId(0),
        name: Name(''),
        email: Email(''),
        body: Body(''),
      );
}
