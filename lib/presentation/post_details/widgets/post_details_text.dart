import 'package:flutter/material.dart';
import 'package:hiring_task/generated/l10n.dart';

class PostDetailsText extends StatelessWidget {
  const PostDetailsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).postDetails,
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
