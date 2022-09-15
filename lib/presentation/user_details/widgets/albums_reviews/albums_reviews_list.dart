import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/domain/user/user.dart';

class AlbumsReviewsList extends StatelessWidget {
  final User user;

  const AlbumsReviewsList({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        physics: const BouncingScrollPhysics(),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return buildAlbumCard(index, context);
        });
  }

  Card buildAlbumCard(int index, BuildContext context) {
    return Card(
      color: AppColors.blueColor1,
      child: ListTile(
        leading: const Icon(Icons.photo_album),
        title: Text(
          user.albumsList![index]!.title!.getOrCrash()!,
          style: Theme.of(context).textTheme.headline2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
