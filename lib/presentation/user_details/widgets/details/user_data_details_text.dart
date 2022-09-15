import 'package:flutter/material.dart';
import 'package:hiring_task/generated/l10n.dart';

class UserDataDetailsText extends StatelessWidget {
  const UserDataDetailsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).userData,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
