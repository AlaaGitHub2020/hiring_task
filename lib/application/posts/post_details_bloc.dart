import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/post/i_post_repossitory.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/post/post_failure.dart';
import 'package:injectable/injectable.dart';

part 'post_details_bloc.freezed.dart';
part 'post_details_event.dart';
part 'post_details_state.dart';

@injectable
class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  final IPostRepository _postRepository;
  final log = getLogger();

  PostDetailsBloc(this._postRepository)
      : super(const PostDetailsState.initial()) {
    on<PostDetailsEvent>(
      (event, emit) async {
        await event.map(
          getPostDetails: (e) async {
            log.i("getPostDetails Started");
            emit(const PostDetailsState.loading());
            final failureOrSuccess =
                await _postRepository.getPostDetails(e.postId);
            PostDetailsState postDetailsState =
                failureOrSuccess.fold((failure) {
              return PostDetailsState.postDetailsFailure(failure);
            }, (success) {
              return PostDetailsState.postDetailsFetched(success);
            });
            emit(postDetailsState);
          },
        );
      },
    );
  }
}
