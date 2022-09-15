import 'package:flutter/material.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/presentation/new_comment_form/widgets/new_comment_form_body.dart';

class NewCommentFormPage extends StatelessWidget {
  final int postId;

  const NewCommentFormPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).addComment)),
      body: NewCommentFormBody(postId: postId),
    );
  }
}
