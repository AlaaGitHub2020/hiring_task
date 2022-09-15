import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/presentation/user_details/widgets/user_details_body.dart';

class UserDetailsPage extends StatelessWidget {
  final User user;

  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username!.getOrCrash()!,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColors.whiteColor1)),
      ),
      body: UserDetailsBody(userId: user.id!.getOrCrash().toString()),
    );
  }
}
