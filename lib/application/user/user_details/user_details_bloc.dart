import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/user/i_user_repository.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/domain/user/user_failure.dart';
import 'package:injectable/injectable.dart';

part 'user_details_bloc.freezed.dart';
part 'user_details_event.dart';
part 'user_details_state.dart';

@injectable
class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  final IUserRepository _userRepository;
  final log = getLogger();

  UserDetailsBloc(this._userRepository)
      : super(const UserDetailsState.initial()) {
    on<UserDetailsEvent>(
      (event, emit) async {
        await event.map(
          getUserDetails: (e) async {
            log.i("getUsersList Started");
            emit(const UserDetailsState.loading());
            final failureOrSuccess =
                await _userRepository.getUserDetails(e.userId);
            UserDetailsState userDetailsState =
                failureOrSuccess.fold((failure) {
              return UserDetailsState.userDetailsFailure(failure);
            }, (success) {
              return UserDetailsState.userDetailsFetched(success);
            });
            emit(userDetailsState);
          },
        );
      },
    );
  }
}
