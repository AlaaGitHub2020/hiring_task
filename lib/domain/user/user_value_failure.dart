import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_value_failure.freezed.dart';

@freezed
abstract class UserValueFailure<T> with _$UserValueFailure<T> {
  const factory UserValueFailure.notValidateUniqueId({
    required T failedValue,
  }) = NotValidateUniqueId<T>;

  const factory UserValueFailure.nameNotCorrect({
    required T failedValue,
  }) = NameNotCorrect<T>;

  const factory UserValueFailure.usernameNotCorrect({
    required T failedValue,
  }) = UsernameNotCorrect<T>;

  const factory UserValueFailure.emailNotCorrect({
    required T failedValue,
  }) = EmailNotCorrect<T>;

  const factory UserValueFailure.streetNotCorrect({
    required T failedValue,
  }) = StreetNotCorrect<T>;

  const factory UserValueFailure.suiteNotCorrect({
    required T failedValue,
  }) = SuiteNotCorrect<T>;

  const factory UserValueFailure.cityNotCorrect({
    required T failedValue,
  }) = CityNotCorrect<T>;

  const factory UserValueFailure.zipcodeNotCorrect({
    required T failedValue,
  }) = ZipcodeNotCorrect<T>;

  const factory UserValueFailure.latitudeNotCorrect({
    required T failedValue,
  }) = LatitudeNoCorrect<T>;

  const factory UserValueFailure.longitudeNotCorrect({
    required T failedValue,
  }) = LongitudeNotCorrect<T>;

  const factory UserValueFailure.phoneNotCorrect({
    required T failedValue,
  }) = PhoneNotCorrect<T>;

  const factory UserValueFailure.websiteNotCorrect({
    required T failedValue,
  }) = WebsiteNotCorrect<T>;

  const factory UserValueFailure.companyNameNotCorrect({
    required T failedValue,
  }) = CompanyNameNotCorrect<T>;

  const factory UserValueFailure.companyCatchPhraseNotCorrect({
    required T failedValue,
  }) = CompanyCatchPhraseNotCorrect<T>;

  const factory UserValueFailure.companyBsNotCorrect({
    required T failedValue,
  }) = CompanyBsNotCorrect<T>;
}
