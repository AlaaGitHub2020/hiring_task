part of 'add_comment_form_bloc.dart';

@freezed
abstract class AddCommentFormState with _$AddCommentFormState {
  const factory AddCommentFormState({
    required Email email,
    required Name name,
    required Body commentBody,
    required AutovalidateMode showErrorMessages,
    required bool isSubmitting,
    required bool isEditing,
    required Option<Either<CommentFailure, Unit>> commentFailureOrSuccessOption,
  }) = _AddCommentFormState;

  factory AddCommentFormState.initial() => AddCommentFormState(
        email: Email(''),
        name: Name(""),
        commentBody: Body(''),
        showErrorMessages: AutovalidateMode.disabled,
        isSubmitting: false,
        isEditing: false,
        commentFailureOrSuccessOption: none(),
      );
}
