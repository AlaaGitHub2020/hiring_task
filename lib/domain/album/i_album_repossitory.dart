import 'package:dartz/dartz.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/album/album_failure.dart';

abstract class IAlbumRepository {
  Future<Either<AlbumFailure, Album>> getAlbumDetails(String albumId);
}
