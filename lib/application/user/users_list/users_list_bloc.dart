import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/api/i_data_repository.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/domain/user/user_failure.dart';
import 'package:injectable/injectable.dart';

part 'users_list_bloc.freezed.dart';
part 'users_list_event.dart';
part 'users_list_state.dart';

@injectable
class UsersListBloc extends Bloc<UsersListEvent, UsersListState> {
  final IDataRepository _dataRepository;
  final log = getLogger();

  UsersListBloc(this._dataRepository) : super(const UsersListState.initial()) {
    on<UsersListEvent>(
      (event, emit) async {
        await event.map(
          getUsersList: (e) async {
            log.i("getUsersList Started");
            emit(const UsersListState.loading());
            final failureOrSuccess = await _dataRepository.fetchUsersList();
            UsersListState usersListState = failureOrSuccess.fold((failure) {
              return UsersListState.usersListFetchedFailure(failure);
            }, (success) {
              return UsersListState.usersListFetched(success);
            });
            emit(usersListState);
          },
        );
      },
    );
  }
}
