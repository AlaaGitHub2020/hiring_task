import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hiring_task/application/user/users_list/users_list_bloc.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/presentation/routes/router.gr.dart';
import 'package:hiring_task/presentation/users/widgets/user_card.dart';

final log = getLogger();

class UsersList extends StatelessWidget {
  final UsersListFetched success;

  const UsersList({Key? key, required this.success}) : super(key: key);

  onTapUserCard(BuildContext context, int index) {
    log.i("onTapUserCard Started");
    context.router.push(UserDetailsRoute(user: success.usersList[index]));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(5),
      physics: const BouncingScrollPhysics(),
      itemCount: success.usersList.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => onTapUserCard(context, index),
          child: UserCard(success: success, index: index),
        );
      },
    );
  }
}
