import 'package:flutter/material.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/presentation/user_details/widgets/details_card.dart';

class PostsReviewsList extends StatelessWidget {
  final User user;

  const PostsReviewsList({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        physics: const BouncingScrollPhysics(),
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return DetailsCard(
            icon: Icons.subtitles,
            cardTitle: user.postsList![index]!.title!.getOrCrash()!,
            cardSubtitle: user.postsList![index]!.body!.getOrCrash()!,
            isPost: true,
          );
        });
  }
}
