import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/application/add_comment_form/add_comment_form_bloc.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/presentation/core/snackbars.dart';
import 'package:hiring_task/presentation/new_comment_form/widgets/comment_body_text_field.dart';
import 'package:hiring_task/presentation/new_comment_form/widgets/email_text_field.dart';
import 'package:hiring_task/presentation/new_comment_form/widgets/name_text_field.dart';
import 'package:hiring_task/presentation/new_comment_form/widgets/send_btn.dart';

class NewCommentFormBody extends StatelessWidget {
  final int postId;

  const NewCommentFormBody({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCommentFormBloc, AddCommentFormState>(
      listener: (context, state) {
        state.commentFailureOrSuccessOption.fold(
            () => null,
            (authFailureOrSuccess) => authFailureOrSuccess.fold(
                    (failure) => failure.maybeMap(
                          addNewCommentFailure: SnackBars.showError(
                              context, S.of(context).addNewCommentFailure),
                          requiredData: (_) => SnackBars.showError(
                              context, S.of(context).requiredFields),
                          orElse: () => null,
                        ), (success) {
                  SnackBars.showSuccess(
                      context, S.of(context).commentSentToTheServer);
                  context.router.pop();
                }));
      },
      builder: (context, state) {
        return state.isSubmitting
            ? const Center(child: CircularProgressIndicator())
            : buildNewCommentFormBody(state);
      },
    );
  }

  Padding buildNewCommentFormBody(AddCommentFormState state) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: state.showErrorMessages,
          child: Column(
            children: [
              const EmailTextField(),
              buildSizedBox(),
              const NameTextField(),
              buildSizedBox(),
              const CommentBodyTextField(),
              buildSizedBox(),
              SendBtn(postId: postId),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(height: 16);
}
