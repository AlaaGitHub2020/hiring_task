part of 'post_details_bloc.dart';

@freezed
abstract class PostDetailsState with _$PostDetailsState {
  const factory PostDetailsState.initial() = _Initial;

  const factory PostDetailsState.loading() = _Loading;

  const factory PostDetailsState.postDetailsFailure(PostsFailure postsFailure) =
      PostDetailsFailure;

  const factory PostDetailsState.postDetailsFetched(Post post) =
      PostDetailsFetched;
}
