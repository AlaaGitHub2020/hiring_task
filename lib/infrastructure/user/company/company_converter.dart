import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/user/company/company.dart';
import 'package:hiring_task/infrastructure/user/company/company_data_transfer_object.dart';

class CompanyConverter
    implements JsonConverter<Company?, Map<String, dynamic>> {
  const CompanyConverter();

  @override
  Company? fromJson(Map<String, dynamic> json) {
    return CompanyDto.fromJson(json).toDomain();
  }

  @override
  Map<String, dynamic> toJson(Company? company) => CompanyDto().toJson();
}
