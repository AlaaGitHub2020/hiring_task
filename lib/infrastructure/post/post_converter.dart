import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/infrastructure/post/post_data_transfer_object.dart';

class PostConverter implements JsonConverter<Post?, Map<String, dynamic>> {
  const PostConverter();

  @override
  Post? fromJson(Map<String, dynamic> json) {
    return PostDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Post? post) => PostDto().toJson();
}
