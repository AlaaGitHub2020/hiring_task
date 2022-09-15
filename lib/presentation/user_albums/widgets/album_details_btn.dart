import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/presentation/routes/router.gr.dart';

final log = getLogger();

class AlbumDetailsBtn extends StatelessWidget {
  final Album album;

  const AlbumDetailsBtn({Key? key, required this.album}) : super(key: key);

  onPressedMore(BuildContext context) {
    log.i("onPressedMore Started");
    context.router.push(AlbumDetailsRoute(album: album));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => onPressedMore(context),
          icon: const Icon(Icons.more_horiz),
        ),
      ],
    );
  }
}
