import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/user/address/address.dart';
import 'package:hiring_task/infrastructure/user/address/address_data_transfer_object.dart';

class AddressConverter
    implements JsonConverter<Address?, Map<String, dynamic>> {
  const AddressConverter();

  @override
  Address? fromJson(Map<String, dynamic> json) {
    return AddressDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Address? address) => AddressDto().toJson();
}
