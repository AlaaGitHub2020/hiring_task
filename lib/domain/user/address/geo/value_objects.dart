import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/core/failures.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/user/address/geo/geo_value_validators.dart';

class Latitude extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Latitude(String? input) {
    return Latitude._(
      validateLatitude(input),
    );
  }

  const Latitude._(this.value);
}

class Longitude extends ValueObject<String?> {
  @override
  final Either<Failure<String?>, String?> value;

  factory Longitude(String? input) {
    return Longitude._(
      validateLongitude(input),
    );
  }

  const Longitude._(this.value);
}
