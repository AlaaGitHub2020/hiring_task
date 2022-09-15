import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/album/value_objects.dart';
import 'package:hiring_task/domain/core/value_objects.dart';

part 'album_data_transfer_object.freezed.dart';
part 'album_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class AlbumDto with _$AlbumDto {
  factory AlbumDto({
    int? userId,
    int? id,
    String? title,
  }) = _AlbumDto;

  factory AlbumDto.fromDomain(Album? album) {
    return AlbumDto(
      userId: album!.userId!.getOrCrash(),
      id: album.id!.getOrCrash(),
      title: album.title!.getOrCrash(),
    );
  }

  factory AlbumDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDtoFromJson(json);
}

extension AlbumDtoX on AlbumDto {
  Album? toDomain() {
    return Album(
      userId: UniqueId(userId),
      id: UniqueId(id),
      title: Title(title),
    );
  }
}
