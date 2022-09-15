import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/presentation/routes/router.gr.dart';

final log = getLogger();

class ViewMoreUserAlbumsBtn extends StatelessWidget {
  final List<Album?>? userAlbums;

  const ViewMoreUserAlbumsBtn({Key? key, required this.userAlbums})
      : super(key: key);

  onPressedViewMoreOfUserAlbums(BuildContext context) {
    log.i("onPressedViewMoreOfUserAlbums Started");
    context.router.push(UserAlbumsRoute(userAlbums: userAlbums));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressedViewMoreOfUserAlbums(context),
      child: Text(S.of(context).viewMoreOfUserAlbums),
    );
  }
}
