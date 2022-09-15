import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/photo/photo_value_validators.dart';

class Title extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Title(String? input) {
    return Title._(
      validateTitle(input),
    );
  }

  const Title._(this.value);
}

class PhotoUrl extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory PhotoUrl(String? input) {
    return PhotoUrl._(
      validatePhotoUrl(input),
    );
  }

  const PhotoUrl._(this.value);
}

class ThumbnailUrl extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory ThumbnailUrl(String? input) {
    return ThumbnailUrl._(
      validateThumbnailUrl(input),
    );
  }

  const ThumbnailUrl._(this.value);
}
