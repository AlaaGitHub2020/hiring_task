import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/user/address/address.dart';
import 'package:hiring_task/domain/user/address/geo/geo.dart';
import 'package:hiring_task/domain/user/address/value_objects.dart';
import 'package:hiring_task/infrastructure/user/address/geo/geo_converter.dart';
import 'package:hiring_task/infrastructure/user/address/geo/geo_data_transfer_object.dart';

part 'address_data_transfer_object.freezed.dart';
part 'address_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class AddressDto with _$AddressDto {
  factory AddressDto({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    @GeoConverter() Geo? geo,
  }) = _AddressDto;

  factory AddressDto.fromDomain(Address? address) {
    return AddressDto(
      street: address!.street!.getOrCrash(),
      suite: address.suite!.getOrCrash(),
      city: address.city!.getOrCrash(),
      zipcode: address.zipcode!.getOrCrash(),
      geo: address.geo,
    );
  }

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);
}

extension AddressDtoX on AddressDto {
  Address? toDomain() {
    return Address(
      street: Street(street),
      suite: Suite(suite),
      city: City(city),
      zipcode: Zipcode(zipcode),
      geo: GeoDto.fromDomain(geo).toDomain(),
    );
  }
}
