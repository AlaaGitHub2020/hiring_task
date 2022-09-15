part of 'users_list_bloc.dart';

@freezed
abstract class UsersListState with _$UsersListState {
  const factory UsersListState.initial() = _Initial;

  const factory UsersListState.loading() = _Loading;

  const factory UsersListState.usersListFetchedFailure(
      UserFailure userFailure) = UsersListFailure;

  const factory UsersListState.usersListFetched(List<User> usersList) =
      UsersListFetched;
}
