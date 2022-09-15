part of 'user_details_bloc.dart';

@freezed
abstract class UserDetailsState with _$UserDetailsState {
  const factory UserDetailsState.initial() = _Initial;

  const factory UserDetailsState.loading() = _Loading;

  const factory UserDetailsState.userDetailsFailure(UserFailure userFailure) =
      UserDetailsFailure;

  const factory UserDetailsState.userDetailsFetched(User userWithFullDetails) =
      UserDetailsFetched;
}
