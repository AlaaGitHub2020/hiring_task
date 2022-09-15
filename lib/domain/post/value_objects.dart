import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/post/post_value_validators.dart';

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

class Body extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Body(String? input) {
    return Body._(
      validateBody(input),
    );
  }

  const Body._(this.value);
}
