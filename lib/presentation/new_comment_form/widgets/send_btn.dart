import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/application/add_comment_form/add_comment_form_bloc.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/generated/l10n.dart';

final log = getLogger();

class SendBtn extends StatelessWidget {
  final int postId;

  const SendBtn({Key? key, required this.postId}) : super(key: key);

  onPressedSend(BuildContext context) {
    log.i("onPressedSend Started");
    context
        .read<AddCommentFormBloc>()
        .add(AddCommentFormEvent.sendPressed(postId));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressedSend(context),
      child: Text(S.of(context).send),
    );
  }
}
