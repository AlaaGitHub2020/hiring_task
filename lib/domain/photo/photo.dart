import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/core/entity.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/photo/value_objects.dart';

part 'photo.freezed.dart';

@freezed
abstract class Photo with _$Photo implements IEntity {
  const factory Photo({
    UniqueId? albumId,
    UniqueId? id,
    Title? title,
    PhotoUrl? url,
    ThumbnailUrl? thumbnailUrl,
  }) = _Album;

  factory Photo.empty() => Photo(
        albumId: UniqueId(0),
        id: UniqueId(0),
        title: Title(''),
        url: PhotoUrl(''),
        thumbnailUrl: ThumbnailUrl(''),
      );
}
