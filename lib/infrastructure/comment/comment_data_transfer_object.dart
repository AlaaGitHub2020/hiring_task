import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/comment/comment.dart';
import 'package:hiring_task/domain/comment/value_objects.dart';
import 'package:hiring_task/domain/core/value_objects.dart';

part 'comment_data_transfer_object.freezed.dart';
part 'comment_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class CommentDto with _$CommentDto {
  factory CommentDto({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) = _CommentDto;

  factory CommentDto.fromDomain(Comment? comment) {
    return CommentDto(
      postId: comment!.postId!.getOrCrash(),
      id: comment.id!.getOrCrash(),
      name: comment.name!.getOrCrash(),
      email: comment.email!.getOrCrash(),
      body: comment.body!.getOrCrash(),
    );
  }

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);
}

extension CommentDtoX on CommentDto {
  Comment? toDomain() {
    return Comment(
      postId: UniqueId(postId),
      id: UniqueId(id),
      name: Name(name),
      email: Email(email),
      body: Body(body),
    );
  }
}
