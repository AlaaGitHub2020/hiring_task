part of 'albums_details_bloc.dart';

@freezed
abstract class AlbumsDetailsState with _$AlbumsDetailsState {
  const factory AlbumsDetailsState.initial() = _Initial;

  const factory AlbumsDetailsState.loading() = _Loading;

  const factory AlbumsDetailsState.albumDetailsFailure(
      AlbumFailure albumFailure) = AlbumDetailsFailure;

  const factory AlbumsDetailsState.albumDetailsFetched(Album album) =
      AlbumDetailsFetched;
}
