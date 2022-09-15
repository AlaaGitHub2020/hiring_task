import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/comment/comment.dart';
import 'package:hiring_task/infrastructure/comment/comment_data_transfer_object.dart';

class CommentConverter
    implements JsonConverter<Comment?, Map<String, dynamic>> {
  const CommentConverter();

  @override
  Comment? fromJson(Map<String, dynamic> json) {
    return CommentDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Comment? comment) => CommentDto().toJson();
}
