import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/user/company/company.dart';
import 'package:hiring_task/domain/user/company/value_objects.dart';

part 'company_data_transfer_object.freezed.dart';
part 'company_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class CompanyDto with _$CompanyDto {
  factory CompanyDto({
    String? name,
    String? catchPhrase,
    String? bs,
  }) = _CompanyDto;

  factory CompanyDto.fromDomain(Company? company) {
    return CompanyDto(
      name: company!.name!.getOrCrash(),
      catchPhrase: company.catchPhrase!.getOrCrash(),
      bs: company.bs!.getOrCrash(),
    );
  }

  factory CompanyDto.fromJson(Map<String, dynamic> json) =>
      _$CompanyDtoFromJson(json);
}

extension CompanyDtoX on CompanyDto {
  Company? toDomain() {
    return Company(
      name: Name(name),
      catchPhrase: CatchPhrase(catchPhrase),
      bs: Bs(bs),
    );
  }
}
