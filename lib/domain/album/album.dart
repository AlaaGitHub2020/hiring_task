import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/album/value_objects.dart';
import 'package:hiring_task/domain/core/entity.dart';
import 'package:hiring_task/domain/core/value_objects.dart';

part 'album.freezed.dart';

@freezed
abstract class Album with _$Album implements IEntity {
  const factory Album({
    UniqueId? userId,
    UniqueId? id,
    Title? title,
  }) = _Album;

  factory Album.empty() => Album(
        userId: UniqueId(0),
        id: UniqueId(0),
        title: Title(''),
      );
}
