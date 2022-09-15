import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/photo/photo.dart';
import 'package:hiring_task/domain/photo/value_objects.dart';

part 'photo_data_transfer_object.freezed.dart';
part 'photo_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class PhotoDto with _$PhotoDto {
  factory PhotoDto({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) = _PhotoDto;

  factory PhotoDto.fromDomain(Photo? photo) {
    return PhotoDto(
      albumId: photo!.albumId!.getOrCrash(),
      id: photo.id!.getOrCrash(),
      title: photo.title!.getOrCrash(),
      url: photo.url!.getOrCrash(),
      thumbnailUrl: photo.thumbnailUrl!.getOrCrash(),
    );
  }

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);
}

extension PhotoDtoX on PhotoDto {
  Photo? toDomain() {
    return Photo(
      albumId: UniqueId(albumId),
      id: UniqueId(id),
      title: Title(title),
      url: PhotoUrl(url),
      thumbnailUrl: ThumbnailUrl(thumbnailUrl),
    );
  }
}
