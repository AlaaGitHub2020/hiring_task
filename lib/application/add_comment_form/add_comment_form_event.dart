part of 'add_comment_form_bloc.dart';

@freezed
abstract class AddCommentFormEvent with _$AddCommentFormEvent {
  const factory AddCommentFormEvent.emailChanged(String emailString) =
      EmailChanged;

  const factory AddCommentFormEvent.nameChanged(String nameString) =
      NameChanged;

  const factory AddCommentFormEvent.commentBodyChanged(
      String commentBodyString) = CommentBodyChanged;

  const factory AddCommentFormEvent.sendPressed(int postId) = SendPressed;
}
