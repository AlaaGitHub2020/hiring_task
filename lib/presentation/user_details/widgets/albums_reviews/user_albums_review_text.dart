import 'package:flutter/material.dart';
import 'package:hiring_task/generated/l10n.dart';

class UserAlbumsReviewText extends StatelessWidget {
  const UserAlbumsReviewText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).userAlbumsReview,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
