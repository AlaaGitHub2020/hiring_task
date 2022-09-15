part of 'posts_list_bloc.dart';

@freezed
abstract class PostsListState with _$PostsListState {
  const factory PostsListState.initial() = _Initial;

  const factory PostsListState.loading() = _Loading;

  const factory PostsListState.fetchingPostsListFailure(
      PostsFailure postsFailure) = FetchingPostsListFailure;

  const factory PostsListState.postsListFetched(List<Post> postsList) =
      PostsListFetched;
}
