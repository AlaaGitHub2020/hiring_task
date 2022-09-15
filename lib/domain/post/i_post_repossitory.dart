import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/post/post_failure.dart';

abstract class IPostRepository {
  Future<Either<PostsFailure, Post>> getPostDetails(String postId);
}
