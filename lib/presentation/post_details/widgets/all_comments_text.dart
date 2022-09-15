import 'package:flutter/material.dart';
import 'package:hiring_task/generated/l10n.dart';

class AllCommentsText extends StatelessWidget {
  const AllCommentsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).allComments,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
