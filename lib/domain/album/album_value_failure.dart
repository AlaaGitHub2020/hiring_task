import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_value_failure.freezed.dart';

@freezed
abstract class AlbumValueFailure<T> with _$AlbumValueFailure<T> {
  const factory AlbumValueFailure.albumTitleNotCorrect({
    required T failedValue,
  }) = AlbumTitleNotCorrect<T>;
}
