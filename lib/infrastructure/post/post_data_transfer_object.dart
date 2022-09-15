import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/post/value_objects.dart';

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
  }) = _PostDto;

  factory PostDto.fromDomain(Post? post) {
    return PostDto(
      userId: post!.userId!.getOrCrash(),
      id: post.id!.getOrCrash(),
      title: post.title!.getOrCrash(),
      body: post.body!.getOrCrash(),
    );
  }

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);
}

extension PostDtoX on PostDto {
  Post? toDomain() {
    return Post(
      userId: UniqueId(userId),
      id: UniqueId(id),
      title: Title(title),
      body: Body(body),
    );
  }
}
