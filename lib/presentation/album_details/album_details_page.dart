import 'package:flutter/material.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/presentation/album_details/widgets/album_detail_body.dart';

class AlbumDetailsPage extends StatelessWidget {
  final Album album;

  const AlbumDetailsPage({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title!.getOrCrash()!,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColors.whiteColor1)),
      ),
      body: AlbumDetailBody(albumId: album.id!.getOrCrash().toString()),
    );
  }
}
