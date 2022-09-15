import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/application/albums/albums_details_bloc.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/presentation/album_details/widgets/album_details_custom_error_widget.dart';
import 'package:hiring_task/presentation/album_details/widgets/album_photos_list.dart';

class AlbumDetailBody extends StatefulWidget {
  final String albumId;

  const AlbumDetailBody({Key? key, required this.albumId}) : super(key: key);

  @override
  State<AlbumDetailBody> createState() => _AlbumDetailBodyState();
}

class _AlbumDetailBodyState extends State<AlbumDetailBody> {
  final log = getLogger();

  @override
  void initState() {
    context
        .read<AlbumsDetailsBloc>()
        .add(AlbumsDetailsEvent.getAlbumDetails(widget.albumId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumsDetailsBloc, AlbumsDetailsState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          albumDetailsFailure: (failure) =>
              AlbumDetailsCustomErrorWidget(failure: failure),
          albumDetailsFetched: (success) => AlbumPhotosList(success: success),
        );
      },
    );
  }
}
