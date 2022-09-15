import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/user/address/geo/geo.dart';
import 'package:hiring_task/domain/user/address/geo/value_objects.dart';

part 'geo_data_transfer_object.freezed.dart';
part 'geo_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class GeoDto with _$GeoDto {
  factory GeoDto({
    String? lat,
    String? lng,
  }) = _GeoDto;

  factory GeoDto.fromDomain(Geo? geo) {
    return GeoDto(
      lat: geo!.lat!.getOrCrash(),
      lng: geo.lng!.getOrCrash(),
    );
  }

  factory GeoDto.fromJson(Map<String, dynamic> json) => _$GeoDtoFromJson(json);
}

extension GeoDtoX on GeoDto {
  Geo? toDomain() {
    return Geo(
      lat: Latitude(lat),
      lng: Longitude(lng),
    );
  }
}
