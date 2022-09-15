part of 'albums_details_bloc.dart';

@freezed
abstract class AlbumsDetailsEvent with _$AlbumsDetailsEvent {
  const factory AlbumsDetailsEvent.getAlbumDetails(String albumId) =
      _GetAlbumDetails;
}
