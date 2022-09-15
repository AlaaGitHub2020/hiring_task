import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/application/add_comment_form/add_comment_form_bloc.dart';
import 'package:hiring_task/generated/l10n.dart';

class CommentBodyTextField extends StatelessWidget {
  const CommentBodyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: S.of(context).body,
        ),
        autocorrect: false,
        style: Theme.of(context).textTheme.headline1,
        keyboardType: TextInputType.text,
        onChanged: (value) => context
            .read<AddCommentFormBloc>()
            .add(AddCommentFormEvent.commentBodyChanged(value)),
        validator: (_) =>
            context.read<AddCommentFormBloc>().state.commentBody.value.fold(
                  (failure) => failure.maybeMap(
                    comment: (value) => value.failure.maybeMap(
                      commentBodyNotCorrect: (_) =>
                          S.of(context).invalidCommentBody,
                      orElse: () => null,
                    ),
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
      ),
    );
  }
}
