import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/api/i_data_repository.dart';
import 'package:hiring_task/domain/comment/comment.dart';
import 'package:hiring_task/domain/comment/comment_failure.dart';
import 'package:hiring_task/domain/comment/value_objects.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:injectable/injectable.dart';

part 'add_comment_form_bloc.freezed.dart';
part 'add_comment_form_event.dart';
part 'add_comment_form_state.dart';

@injectable
class AddCommentFormBloc
    extends Bloc<AddCommentFormEvent, AddCommentFormState> {
  final IDataRepository _dataRepository;
  final log = getLogger();

  AddCommentFormBloc(this._dataRepository)
      : super(AddCommentFormState.initial()) {
    on<AddCommentFormEvent>(
      (event, emit) async {
        await event.map(
          emailChanged: (e) async {
            log.i("emailChanged started");
            AddCommentFormState addCommentFormState = state.copyWith(
              email: Email(e.emailString),
              isEditing: true,
              commentFailureOrSuccessOption: none(),
            );
            emit(addCommentFormState);
          },
          nameChanged: (e) async {
            log.i("nameChanged started");
            AddCommentFormState addCommentFormState = state.copyWith(
              name: Name(e.nameString),
              isEditing: true,
              commentFailureOrSuccessOption: none(),
            );
            emit(addCommentFormState);
          },
          commentBodyChanged: (e) async {
            log.i("commentBodyChanged started");
            AddCommentFormState addCommentFormState = state.copyWith(
              commentBody: Body(e.commentBodyString),
              isEditing: true,
              commentFailureOrSuccessOption: none(),
            );
            emit(addCommentFormState);
          },
          sendPressed: (e) async {
            log.i("sendPressed started");
            AddCommentFormState addCommentFormState =
                await _performActionOnDataRepositoryForSendingTheComment(
              forwardedCall: _dataRepository.sendComment,
              postId: e.postId,
            );
            emit(addCommentFormState);
          },
        );
      },
    );
  }

  Future<AddCommentFormState>
      _performActionOnDataRepositoryForSendingTheComment({
    required Future<Either<CommentFailure, Unit>> Function(Comment comment)
        forwardedCall,
    required int? postId,
  }) async {
    log.i("_performActionOnDataRepositoryForSendingTheComment started");
    Either<CommentFailure, Unit> failureOrSuccess;
    final bool isEmailValid = state.email.isValid();
    final bool isNameValid = state.name.isValid();
    final bool isBodyValid = state.commentBody.isValid();

    late AddCommentFormState addCommentFormState;
    late Comment comment;
    if (isEmailValid && isNameValid && isBodyValid) {
      addCommentFormState = state.copyWith(
        isSubmitting: true,
        showErrorMessages: AutovalidateMode.always,
        commentFailureOrSuccessOption: none(),
      );
      emit(addCommentFormState);

      comment = Comment(
        email: state.email,
        name: state.name,
        body: state.commentBody,
        postId: UniqueId(postId),
      );
      failureOrSuccess = await forwardedCall(comment);
      addCommentFormState = state.copyWith(
        isSubmitting: false,
        showErrorMessages: AutovalidateMode.always,
        commentFailureOrSuccessOption: optionOf(failureOrSuccess),
      );
      return (addCommentFormState);
    } else {
      addCommentFormState = state.copyWith(
        isSubmitting: false,
        showErrorMessages: AutovalidateMode.always,
        commentFailureOrSuccessOption:
            optionOf(left(const CommentFailure.requiredData())),
      );
      return (addCommentFormState);
    }
  }
}
