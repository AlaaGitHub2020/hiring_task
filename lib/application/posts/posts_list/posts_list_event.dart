part of 'posts_list_bloc.dart';

@freezed
abstract class PostsListEvent with _$PostsListEvent {
  const factory PostsListEvent.getPostsList(String userId) = _GetPostsList;
}
