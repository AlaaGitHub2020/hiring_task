import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_failure.freezed.dart';

@freezed
abstract class PhotoFailure with _$PhotoFailure {
  const factory PhotoFailure.unexpected() = _Unexpected;

  const factory PhotoFailure.fetchPhotosListFailure() = _FetchPhotosListFailure;
}
