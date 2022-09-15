import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/album/value_objects.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/photo/photo.dart';
import 'package:hiring_task/infrastructure/photo/photo_converter.dart';
import 'package:hiring_task/infrastructure/photo/photo_data_transfer_object.dart';

part 'album_data_transfer_object.freezed.dart';
part 'album_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class AlbumDto with _$AlbumDto {
  factory AlbumDto({
    int? userId,
    int? id,
    String? title,
    @PhotoConverter() List<Photo?>? photosList,
  }) = _AlbumDto;

  factory AlbumDto.fromDomain(Album? album) {
    return AlbumDto(
      userId: album!.userId!.getOrCrash(),
      id: album.id!.getOrCrash(),
      title: album.title!.getOrCrash(),
      photosList: album.photosList,
    );
  }

  factory AlbumDto.fromJson(Map<String, dynamic> json) =>
      _$AlbumDtoFromJson(json);
}

extension AlbumDtoX on AlbumDto {
  Album? toDomain() {
    List<Photo?>? thePhotosList = [];
    if (photosList != null) {
      for (int x = 0; x < photosList!.length; x++) {
        thePhotosList.add(PhotoDto.fromDomain(photosList![x]).toDomain()!);
      }
    }
    return Album(
      userId: UniqueId(userId),
      id: UniqueId(id),
      title: Title(title),
      photosList: thePhotosList,
    );
  }
}
