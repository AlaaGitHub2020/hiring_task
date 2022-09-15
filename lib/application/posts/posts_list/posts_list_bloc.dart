import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/api/i_data_repository.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/post/post_failure.dart';
import 'package:injectable/injectable.dart';

part 'posts_list_bloc.freezed.dart';
part 'posts_list_event.dart';
part 'posts_list_state.dart';

@injectable
class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  final IDataRepository _dataRepository;
  final log = getLogger();

  PostsListBloc(this._dataRepository) : super(const PostsListState.initial()) {
    on<PostsListEvent>(
      (event, emit) async {
        await event.map(
          getPostsList: (e) async {
            log.i("getPostsList Started");
            emit(const PostsListState.loading());
            final failureOrSuccess = await _dataRepository.fetchPostsList();
            PostsListState postsListState = failureOrSuccess.fold((failure) {
              return PostsListState.fetchingPostsListFailure(failure);
            }, (success) {
              return PostsListState.postsListFetched(success);
            });
            emit(postsListState);
          },
        );
      },
    );
  }
}
