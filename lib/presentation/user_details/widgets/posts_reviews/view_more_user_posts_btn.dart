import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/generated/l10n.dart';

final log = getLogger();

class ViewMoreUserPostsBtn extends StatelessWidget {
  const ViewMoreUserPostsBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        log.i("onPressedViewMoreOfUserPosts Started");
      },
      child: Text(S.of(context).viewMoreOfUserPosts),
    );
  }
}
