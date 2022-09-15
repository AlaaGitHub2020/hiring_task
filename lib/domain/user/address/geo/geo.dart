import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/user/address/geo/value_objects.dart';

part 'geo.freezed.dart';

@freezed
abstract class Geo with _$Geo {
  const factory Geo({
    Latitude? lat,
    Longitude? lng,
  }) = _Geo;

  factory Geo.empty() => Geo(
        lat: Latitude(''),
        lng: Longitude(''),
      );
}
