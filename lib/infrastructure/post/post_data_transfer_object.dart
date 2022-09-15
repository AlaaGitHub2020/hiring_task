import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/comment/comment.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/post/value_objects.dart';
import 'package:hiring_task/infrastructure/comment/comment_converter.dart';
import 'package:hiring_task/infrastructure/comment/comment_data_transfer_object.dart';

part 'post_data_transfer_object.freezed.dart';
part 'post_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class PostDto with _$PostDto {
  factory PostDto({
    int? userId,
    int? id,
    String? title,
    String? body,
    @CommentConverter() List<Comment?>? commentsList,
  }) = _PostDto;

  factory PostDto.fromDomain(Post? post) {
    return PostDto(
      userId: post!.userId!.getOrCrash(),
      id: post.id!.getOrCrash(),
      title: post.title!.getOrCrash(),
      body: post.body!.getOrCrash(),
      commentsList: post.commentsList,
    );
  }

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);
}

extension PostDtoX on PostDto {
  Post? toDomain() {
    List<Comment?>? theCommentsList = [];
    if (commentsList != null) {
      for (int x = 0; x < commentsList!.length; x++) {
        theCommentsList
            .add(CommentDto.fromDomain(commentsList![x]).toDomain()!);
      }
    }
    return Post(
      userId: UniqueId(userId),
      id: UniqueId(id),
      title: Title(title),
      body: Body(body),
      commentsList: theCommentsList,
    );
  }
}
