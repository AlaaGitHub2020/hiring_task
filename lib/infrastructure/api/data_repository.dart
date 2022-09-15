import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/album/album_failure.dart';
import 'package:hiring_task/domain/api/api_failure.dart';
import 'package:hiring_task/domain/api/i_api_repository.dart';
import 'package:hiring_task/domain/api/i_data_repository.dart';
import 'package:hiring_task/domain/comment/comment.dart';
import 'package:hiring_task/domain/comment/comment_failure.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/core/utilities/strings.dart';
import 'package:hiring_task/domain/photo/photo.dart';
import 'package:hiring_task/domain/photo/photo_failure.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/post/post_failure.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/domain/user/user_failure.dart';
import 'package:hiring_task/infrastructure/album/album_data_transfer_object.dart';
import 'package:hiring_task/infrastructure/comment/comment_data_transfer_object.dart';
import 'package:hiring_task/infrastructure/photo/photo_data_transfer_object.dart';
import 'package:hiring_task/infrastructure/post/post_data_transfer_object.dart';
import 'package:hiring_task/infrastructure/user/user_data_transfer_object.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDataRepository)
class DataRepository implements IDataRepository {
  final IAPIRepository _apiRepository;

  final log = getLogger();

  DataRepository(this._apiRepository);

  @override
  Future<Either<UserFailure, List<User>>> fetchUsersList() async {
    try {
      log.i("fetchUsersList Started");
      Either<APIFailure, Response<dynamic>> getUsersListResponse =
          await _apiRepository.getData(Strings.eAPIUsersList);
      List<User> usersList = [];
      late List<dynamic>? users;
      getUsersListResponse.fold((failure) {
        log.e("failure:$failure");
      }, (response) {
        var decodedResponse = json.decode(response.data);
        users = decodedResponse
            .map((e) => UserDto.fromJson(e).toDomain() ?? User.empty())
            .toList();
      });

      for (int x = 0; x < users!.length; x++) {
        usersList.add(users![x]);
      }
      log.i("usersList:$usersList");
      return right(usersList);
    } catch (e) {
      log.e("ERROR:$e");
      return left(const UserFailure.fetchUsersListFailure());
    }
  }

  @override
  Future<Either<PostsFailure, List<Post>>> fetchPostsList() async {
    try {
      log.i("fetchPostsList Started");
      Either<APIFailure, Response<dynamic>> getPostsListResponse =
          await _apiRepository.getData(Strings.eAPIPostsList);
      List<Post> postsList = [];
      late List<dynamic>? posts;
      getPostsListResponse.fold((failure) {
        log.e("failure:$failure");
      }, (response) {
        var decodedResponse = json.decode(response.data);
        posts = decodedResponse
            .map((e) => PostDto.fromJson(e).toDomain() ?? Post.empty())
            .toList();
      });

      for (int x = 0; x < posts!.length; x++) {
        postsList.add(posts![x]);
      }
      log.i("postsList:$postsList");
      return right(postsList);
    } catch (e) {
      log.e("ERROR:$e");
      return left(const PostsFailure.fetchPostsListFailure());
    }
  }

  @override
  Future<Either<CommentFailure, List<Comment>>> fetchCommentsList() async {
    try {
      log.i("fetchCommentsList Started");
      Either<APIFailure, Response<dynamic>> getCommentsListResponse =
          await _apiRepository.getData(Strings.eAPICommentsList);
      List<Comment> commentsList = [];
      late List<dynamic>? comments;
      getCommentsListResponse.fold((failure) {
        log.e("failure:$failure");
      }, (response) {
        var decodedResponse = json.decode(response.data);
        comments = decodedResponse
            .map((e) => CommentDto.fromJson(e).toDomain() ?? Comment.empty())
            .toList();
      });

      for (int x = 0; x < comments!.length; x++) {
        commentsList.add(comments![x]);
      }
      log.i("commentsList:$commentsList");
      return right(commentsList);
    } catch (e) {
      log.e("ERROR:$e");
      return left(const CommentFailure.fetchCommentsListFailure());
    }
  }

  @override
  Future<Either<AlbumFailure, List<Album>>> fetchAlbumsList() async {
    try {
      log.i("fetchAlbumsList Started");
      Either<APIFailure, Response<dynamic>> getAlbumsListResponse =
          await _apiRepository.getData(Strings.eAPIAlbumsList);
      List<Album> albumsList = [];
      late List<dynamic>? albums;
      getAlbumsListResponse.fold((failure) {
        log.e("failure:$failure");
      }, (response) {
        var decodedResponse = json.decode(response.data);
        albums = decodedResponse
            .map((e) => AlbumDto.fromJson(e).toDomain() ?? Album.empty())
            .toList();
      });

      for (int x = 0; x < albums!.length; x++) {
        albumsList.add(albums![x]);
      }
      log.i("albumsList:$albumsList");
      return right(albumsList);
    } catch (e) {
      log.e("ERROR:$e");
      return left(const AlbumFailure.fetchAlbumsListFailure());
    }
  }

  @override
  Future<Either<PhotoFailure, List<Photo>>> fetchPhotosList() async {
    try {
      log.i("fetchPhotosList Started");
      Either<APIFailure, Response<dynamic>> getPhotosListResponse =
          await _apiRepository.getData(Strings.eAPIPhotosList);
      List<Photo> photosList = [];
      late List<dynamic>? photos;
      getPhotosListResponse.fold((failure) {
        log.e("failure:$failure");
      }, (response) {
        var decodedResponse = json.decode(response.data);
        photos = decodedResponse
            .map((e) => PhotoDto.fromJson(e).toDomain() ?? Photo.empty())
            .toList();
      });

      for (int x = 0; x < photos!.length; x++) {
        photosList.add(photos![x]);
      }
      log.i("photosList:$photosList");
      return right(photosList);
    } catch (e) {
      log.e("ERROR:$e");
      return left(const PhotoFailure.fetchPhotosListFailure());
    }
  }
}
