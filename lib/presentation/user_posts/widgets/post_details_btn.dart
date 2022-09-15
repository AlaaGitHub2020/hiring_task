import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/presentation/routes/router.gr.dart';

final log = getLogger();

class PostDetailsBtn extends StatelessWidget {
  final Post post;

  const PostDetailsBtn({Key? key, required this.post}) : super(key: key);

  onPressedMore(BuildContext context) {
    log.i("onPressedMore Started");
    context.router.push(PostDetailsRoute(post: post));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onPressedMore(context),
        icon: const Icon(Icons.more_horiz));
  }
}
