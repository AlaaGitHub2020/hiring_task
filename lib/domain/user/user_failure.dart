import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_failure.freezed.dart';

@freezed
abstract class UserFailure with _$UserFailure {
  const factory UserFailure.unexpected() = _Unexpected;

  const factory UserFailure.fetchUsersListFailure() = _FetchUsersListFailure;

  const factory UserFailure.getUserDetailsFailure() = _GetUserDetailsFailure;
}
