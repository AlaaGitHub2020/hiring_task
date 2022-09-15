import 'package:flutter/material.dart';
import 'package:hiring_task/generated/l10n.dart';

class UserPostsReviewText extends StatelessWidget {
  const UserPostsReviewText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).userPostsReview,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
