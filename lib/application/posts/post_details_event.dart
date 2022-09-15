part of 'post_details_bloc.dart';

@freezed
abstract class PostDetailsEvent with _$PostDetailsEvent {
  const factory PostDetailsEvent.getPostDetails(String postId) =
      _getPostDetails;
}
