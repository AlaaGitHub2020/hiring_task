import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/album/album_failure.dart';
import 'package:hiring_task/domain/comment/comment.dart';
import 'package:hiring_task/domain/comment/comment_failure.dart';
import 'package:hiring_task/domain/photo/photo.dart';
import 'package:hiring_task/domain/photo/photo_failure.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/post/post_failure.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/domain/user/user_failure.dart';

abstract class IDataRepository {
  Future<Either<UserFailure, List<User>>> fetchUsersList();

  Future<Either<PostsFailure, List<Post>>> fetchPostsList();

  Future<Either<CommentFailure, List<Comment>>> fetchCommentsList();

  Future<Either<AlbumFailure, List<Album>>> fetchAlbumsList();

  Future<Either<PhotoFailure, List<Photo>>> fetchPhotosList();

  Future<Either<CommentFailure, Unit>> sendComment(Comment comment);
}
