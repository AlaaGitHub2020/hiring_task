import 'package:flutter/material.dart';
import 'package:hiring_task/application/user/user_details/user_details_bloc.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/generated/l10n.dart';

class UserDetailsCustomErrorWidget extends StatelessWidget {
  final UserDetailsFailure failure;

  const UserDetailsCustomErrorWidget({Key? key, required this.failure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.userFailure.maybeMap(
          getUserDetailsFailure: (_) => S.of(context).getUserDetailsFailure,
          orElse: () => S.of(context).unexpected,
        ),
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: AppColors.redColor1),
        textAlign: TextAlign.center,
      ),
    );
  }
}
