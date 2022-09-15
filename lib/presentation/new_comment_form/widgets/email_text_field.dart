import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/application/add_comment_form/add_comment_form_bloc.dart';
import 'package:hiring_task/generated/l10n.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: S.of(context).email,
        ),
        autocorrect: false,
        style: Theme.of(context).textTheme.headline1,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => context
            .read<AddCommentFormBloc>()
            .add(AddCommentFormEvent.emailChanged(value)),
        validator: (_) =>
            context.read<AddCommentFormBloc>().state.email.value.fold(
                  (failure) => failure.maybeMap(
                    comment: (value) => value.failure.maybeMap(
                      commentEmailNotCorrect: (_) => S.of(context).invalidEmail,
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
