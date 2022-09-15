import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/album/album_value_validators.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/core/value_objects.dart';

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
