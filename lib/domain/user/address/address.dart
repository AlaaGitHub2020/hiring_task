import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/user/address/geo/geo.dart';
import 'package:hiring_task/domain/user/address/value_objects.dart';

part 'address.freezed.dart';

@freezed
abstract class Address with _$Address {
  const factory Address({
    Street? street,
    Suite? suite,
    City? city,
    Zipcode? zipcode,
    Geo? geo,
  }) = _Address;

  factory Address.empty() => Address(
        street: Street(''),
        suite: Suite(''),
        city: City(''),
        zipcode: Zipcode(''),
        geo: Geo.empty(),
      );
}
