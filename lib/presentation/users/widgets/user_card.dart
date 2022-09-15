import 'package:flutter/material.dart';
import 'package:hiring_task/application/user/users_list/users_list_bloc.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/generated/l10n.dart';

class UserCard extends StatelessWidget {
  final int index;
  final UsersListFetched success;

  const UserCard({Key? key, required this.success, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: AppColors.greenColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildUserNameText(context, index),
            buildNameText(context, index),
          ],
        ),
      ),
    );
  }

  Text buildNameText(BuildContext context, int index) {
    return Text(
      '${S.of(context).name}${success.usersList[index].name!.getOrCrash()}',
      style: Theme.of(context).textTheme.headline2,
    );
  }

  Text buildUserNameText(BuildContext context, int index) {
    return Text(
      '${S.of(context).userName}${success.usersList[index].username!.getOrCrash()}',
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
