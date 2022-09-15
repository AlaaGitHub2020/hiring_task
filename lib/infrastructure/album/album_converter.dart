import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/infrastructure/album/album_data_transfer_object.dart';

class AlbumConverter implements JsonConverter<Album?, Map<String, dynamic>> {
  const AlbumConverter();

  @override
  Album? fromJson(Map<String, dynamic> json) {
    return AlbumDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Album? album) => AlbumDto().toJson();
}
