import 'package:flutter/material.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/presentation/user_albums/widgets/album_details_btn.dart';

class UserAlbumsBody extends StatelessWidget {
  final List<Album?>? userAlbums;

  const UserAlbumsBody({Key? key, required this.userAlbums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userAlbums!.length,
        primary: true,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: AppColors.blueColor1,
            child: ListTile(
              iconColor: AppColors.greenColor,
              leading: const Icon(Icons.photo_album, size: 30),
              title: buildAlbumTitleText(index, context),
              subtitle: AlbumDetailsBtn(album: userAlbums![index]!),
              // trailing: AlbumDetailsBtn(album: userAlbums![index]!),
            ),
          );
        });
  }

  Text buildAlbumTitleText(int index, BuildContext context) {
    return Text(
      userAlbums![index]!.title!.getOrCrash()!,
      style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(color: AppColors.whiteColor1),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
