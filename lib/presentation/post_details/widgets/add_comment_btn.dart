import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/presentation/routes/router.gr.dart';

final log = getLogger();

class AddCommentBtn extends StatelessWidget {
  final int postId;

  const AddCommentBtn({Key? key, required this.postId}) : super(key: key);

  onPressedAddComment(BuildContext context) {
    log.i("onPressedAddComment Started");
    context.router.push(NewCommentFormRoute(postId: postId));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ElevatedButton(
          onPressed: () => onPressedAddComment(context),
          child: Text(S.of(context).addComment)),
    );
  }
}
