import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/photo/photo.dart';
import 'package:hiring_task/infrastructure/photo/photo_data_transfer_object.dart';

class PhotoConverter implements JsonConverter<Photo?, Map<String, dynamic>> {
  const PhotoConverter();

  @override
  Photo? fromJson(Map<String, dynamic> json) {
    return PhotoDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Photo? photo) => PhotoDto().toJson();
}
