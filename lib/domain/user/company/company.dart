import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/user/company/value_objects.dart';

part 'company.freezed.dart';

@freezed
abstract class Company with _$Company {
  const factory Company({
    Name? name,
    CatchPhrase? catchPhrase,
    Bs? bs,
  }) = _Company;

  factory Company.empty() => Company(
        name: Name(''),
        catchPhrase: CatchPhrase(''),
        bs: Bs(''),
      );
}
