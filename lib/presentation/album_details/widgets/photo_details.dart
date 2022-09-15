import 'package:flutter/material.dart';
import 'package:hiring_task/application/albums/albums_details_bloc.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/generated/l10n.dart';

class PhotoDetails extends StatelessWidget {
  final AlbumDetailsFetched success;
  final int itemIndex;

  const PhotoDetails({Key? key, required this.success, required this.itemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.greenColor.withOpacity(0.6),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSpacer(),
            buildUserIdText(context),
            buildAlbumIdText(context),
            buildAlbumTitleText(context),
            buildSpacer(),
            buildPhotoDetails(context),
            buildSpacer(),
          ],
        ),
      ),
    );
  }

  ListTile buildPhotoDetails(BuildContext context) {
    return ListTile(
      leading: buildImage(),
      title: buildPhotoTitleText(context),
      trailing: buildThumbnailImage(),
    );
  }

  Text buildPhotoTitleText(BuildContext context) {
    return Text(
      "${S.of(context).photoTitle}${success.album.photosList![itemIndex]!.title!.getOrCrash()!}",
      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
      overflow: TextOverflow.ellipsis,
      maxLines: 7,
    );
  }

  Image buildThumbnailImage() {
    return Image.network(
      success.album.photosList![itemIndex]!.thumbnailUrl!.getOrCrash()!,
      fit: BoxFit.contain,
      height: 50,
      width: 50,
    );
  }

  Image buildImage() {
    return Image.network(
      success.album.photosList![itemIndex]!.url!.getOrCrash()!,
      fit: BoxFit.contain,
      height: 50,
      width: 50,
    );
  }

  Text buildAlbumTitleText(BuildContext context) {
    return Text(
      "${S.of(context).albumTitle}${success.album.title!.getOrCrash()!}",
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Text buildAlbumIdText(BuildContext context) {
    return Text(
      "${S.of(context).albumId}${success.album.id!.getOrCrash()!}",
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Text buildUserIdText(BuildContext context) {
    return Text(
      "${S.of(context).userId}${success.album.userId!.getOrCrash()!}",
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Spacer buildSpacer() => const Spacer();
}
