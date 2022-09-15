import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/album/album_failure.dart';
import 'package:hiring_task/domain/api/i_data_repository.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/post/post_failure.dart';
import 'package:hiring_task/domain/user/i_user_repository.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/domain/user/user_failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IDataRepository _dataRepository;

  final log = getLogger();

  UserRepository(this._dataRepository);

  @override
  Future<Either<UserFailure, User>> getUserDetails(String userId) async {
    try {
      log.i("getUserDetails Started");
      User user = User.empty();
      Either<UserFailure, List<User>> getUsersList =
          await _dataRepository.fetchUsersList();
      Either<PostsFailure, List<Post>> getPostsList =
          await _dataRepository.fetchPostsList();
      Either<AlbumFailure, List<Album>> getAlbumsList =
          await _dataRepository.fetchAlbumsList();
      getUsersList.fold((failure) {
        log.e("failure:$failure");
      }, (success) async {
        log.i("success:$success");
        for (int x = 0; x < success.length; x++) {
          if (success[x].id!.getOrCrash().toString() == userId) {
            user = user.copyWith(
              id: success[x].id,
              name: success[x].name,
              username: success[x].username,
              phone: success[x].phone,
              email: success[x].email,
              address: success[x].address,
              company: success[x].company,
              website: success[x].website,
            );
          }
        }
        log.i("user After Update the data : $user");
        getPostsList.fold((failure) {
          log.e("failure:$failure");
        }, (success) async {
          log.i("success:$success");
          List<Post> userPosts = [];
          for (int x = 0; x < success.length; x++) {
            if (success[x].userId!.getOrCrash().toString() == userId) {
              userPosts.add(success[x]);
            }
          }
          user = user.copyWith(postsList: userPosts);
          log.i("user After Update the posts : $user");
          getAlbumsList.fold((failure) {
            log.e("failure:$failure");
          }, (success) {
            log.i("success:$success");
            List<Album> userAlbums = [];
            for (int x = 0; x < success.length; x++) {
              if (success[x].userId!.getOrCrash().toString() == userId) {
                userAlbums.add(success[x]);
              }
            }
            user = user.copyWith(albumsList: userAlbums);
            log.i("user After Update the Albums : $user");
          });
        });
      });
      return right(user);
    } catch (e) {
      log.e("ERROR:$e");
      return left(const UserFailure.getUserDetailsFailure());
    }
  }
}
