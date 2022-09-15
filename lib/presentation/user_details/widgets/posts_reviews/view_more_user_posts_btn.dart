import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/presentation/routes/router.gr.dart';

final log = getLogger();

class ViewMoreUserPostsBtn extends StatelessWidget {
  final List<Post?>? userPosts;

  const ViewMoreUserPostsBtn({Key? key, required this.userPosts})
      : super(key: key);

  onPressedViewMoreOfUserPosts(BuildContext context) {
    log.i("onPressedViewMoreOfUserPosts Started");
    context.router.push(UserPostsRoute(userPosts: userPosts));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressedViewMoreOfUserPosts(context),
      child: Text(S.of(context).viewMoreOfUserPosts),
    );
  }
}
