import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/user/address/geo/geo.dart';
import 'package:hiring_task/infrastructure/user/address/geo/geo_data_transfer_object.dart';

class GeoConverter implements JsonConverter<Geo?, Map<String, dynamic>> {
  const GeoConverter();

  @override
  Geo? fromJson(Map<String, dynamic> json) {
    return GeoDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Geo? geo) => GeoDto().toJson();
}
