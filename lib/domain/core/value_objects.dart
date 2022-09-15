import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/core/errors.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/user/user_value_failure.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<Failure<T>, T> get value;

  /// Throws [UnexpectedValueErrors] containing the [Failure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((failure) => throw UnexpectedValueErrors(failure), id);
  }

  Either<Failure<dynamic>, Unit?> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class UniqueId extends ValueObject<int?> {
  @override
  final Either<Failure<int?>, int?> value;

  factory UniqueId(int? input) {
    return UniqueId._(
      validateUniqueId(input),
    );
  }

  const UniqueId._(this.value);
}

Either<Failure<int?>, int?> validateUniqueId(int? input) {
  if (input == null) {
    return left(
      Failure.user(
        UserValueFailure.notValidateUniqueId(failedValue: input),
      ),
    );
  } else {
    if (input >= 0) {
      return right(input);
    } else {
      return left(
        Failure.user(
          UserValueFailure.notValidateUniqueId(failedValue: input),
        ),
      );
    }
  }
}
