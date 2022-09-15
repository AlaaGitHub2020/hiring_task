import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/album/album_failure.dart';
import 'package:hiring_task/domain/album/i_album_repossitory.dart';
import 'package:hiring_task/domain/api/i_data_repository.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/domain/photo/photo.dart';
import 'package:hiring_task/domain/photo/photo_failure.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAlbumRepository)
class AlbumRepository implements IAlbumRepository {
  final IDataRepository _dataRepository;

  final log = getLogger();

  AlbumRepository(this._dataRepository);

  @override
  Future<Either<AlbumFailure, Album>> getAlbumDetails(String albumId) async {
    try {
      log.i("getAlbumDetails Started");
      Album album = Album.empty();
      Either<AlbumFailure, List<Album>> getAlbumList =
          await _dataRepository.fetchAlbumsList();
      Either<PhotoFailure, List<Photo>> getPhotosList =
          await _dataRepository.fetchPhotosList();
      getAlbumList.fold((failure) {
        log.e("failure:$failure");
      }, (success) async {
        log.i("success:$success");
        for (int x = 0; x < success.length; x++) {
          if (success[x].id!.getOrCrash().toString() == albumId) {
            album = album.copyWith(
              userId: success[x].userId,
              id: success[x].id,
              title: success[x].title,
            );
          }
        }
        log.i("album After Update the data : $album");
        getPhotosList.fold((failure) {
          log.e("failure:$failure");
        }, (success) {
          log.i("success:$success");
          List<Photo> albumPhotos = [];
          for (int x = 0; x < success.length; x++) {
            if (success[x].albumId!.getOrCrash().toString() == albumId) {
              albumPhotos.add(success[x]);
            }
          }
          album = album.copyWith(photosList: albumPhotos);
          log.i("album After Update the Comments : $album");
        });
      });
      return right(album);
    } catch (e) {
      log.e("ERROR:$e");
      return left(const AlbumFailure.getAlbumDetailsFailure());
    }
  }
}
