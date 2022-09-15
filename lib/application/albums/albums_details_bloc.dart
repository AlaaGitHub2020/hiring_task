import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/album/album_failure.dart';
import 'package:hiring_task/domain/album/i_album_repossitory.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:injectable/injectable.dart';

part 'albums_details_bloc.freezed.dart';
part 'albums_details_event.dart';
part 'albums_details_state.dart';

@injectable
class AlbumsDetailsBloc extends Bloc<AlbumsDetailsEvent, AlbumsDetailsState> {
  final IAlbumRepository _albumRepository;
  final log = getLogger();

  AlbumsDetailsBloc(this._albumRepository)
      : super(const AlbumsDetailsState.initial()) {
    on<AlbumsDetailsEvent>(
      (event, emit) async {
        await event.map(
          getAlbumDetails: (e) async {
            log.i("getAlbumDetails Started");
            emit(const AlbumsDetailsState.loading());
            final failureOrSuccess =
                await _albumRepository.getAlbumDetails(e.albumId);
            AlbumsDetailsState albumsDetailsState =
                failureOrSuccess.fold((failure) {
              return AlbumsDetailsState.albumDetailsFailure(failure);
            }, (success) {
              return AlbumsDetailsState.albumDetailsFetched(success);
            });
            emit(albumsDetailsState);
          },
        );
      },
    );
  }
}
