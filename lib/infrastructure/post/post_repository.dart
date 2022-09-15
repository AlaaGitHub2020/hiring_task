import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/api/i_data_repository.dart';
import 'package:hiring_task/domain/comment/comment.dart';
import 'package:hiring_task/domain/comment/comment_failure.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/post/i_post_repossitory.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/post/post_failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IPostRepository)
class PostRepository implements IPostRepository {
  final IDataRepository _dataRepository;

  final log = getLogger();

  PostRepository(this._dataRepository);

  @override
  Future<Either<PostsFailure, Post>> getPostDetails(String postId) async {
    try {
      log.i("getPostDetails Started");
      Post post = Post.empty();
      Either<PostsFailure, List<Post>> getPostsList =
          await _dataRepository.fetchPostsList();
      Either<CommentFailure, List<Comment>> getCommentsList =
          await _dataRepository.fetchCommentsList();
      getPostsList.fold((failure) {
        log.e("failure:$failure");
      }, (success) async {
        log.i("success:$success");
        for (int x = 0; x < success.length; x++) {
          if (success[x].id!.getOrCrash().toString() == postId) {
            post = post.copyWith(
              userId: success[x].userId,
              id: success[x].id,
              title: success[x].title,
              body: success[x].body,
            );
          }
        }
        log.i("post After Update the data : $post");
        getCommentsList.fold((failure) {
          log.e("failure:$failure");
        }, (success) {
          log.i("success:$success");
          List<Comment> postComments = [];
          for (int x = 0; x < success.length; x++) {
            if (success[x].postId!.getOrCrash().toString() == postId) {
              postComments.add(success[x]);
            }
          }
          post = post.copyWith(commentsList: postComments);
          log.i("post After Update the Comments : $post");
        });
      });
      return right(post);
    } catch (e) {
      log.e("ERROR:$e");
      return left(const PostsFailure.getPostDetailsFailure());
    }
  }
}
