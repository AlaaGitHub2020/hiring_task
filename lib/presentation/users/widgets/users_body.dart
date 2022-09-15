import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/application/user/users_list/users_list_bloc.dart';
import 'package:hiring_task/presentation/users/widgets/users_List.dart';
import 'package:hiring_task/presentation/users/widgets/users_custom_error_widget.dart';

class UsersBody extends StatefulWidget {
  const UsersBody({Key? key}) : super(key: key);

  @override
  State<UsersBody> createState() => _UsersBodyState();
}

class _UsersBodyState extends State<UsersBody> {
  @override
  void initState() {
    context.read<UsersListBloc>().add(const UsersListEvent.getUsersList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersListBloc, UsersListState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          usersListFetchedFailure: (failure) =>
              UsersCustomErrorWidget(failure: failure),
          usersListFetched: (success) => UsersList(success: success),
        );
      },
    );
  }
}
