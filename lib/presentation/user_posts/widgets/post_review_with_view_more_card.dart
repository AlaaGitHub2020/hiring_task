import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/presentation/user_posts/widgets/post_details_btn.dart';

class PostReviewWithViewMoreCard extends StatelessWidget {
  final int index;
  final List<Post?>? userPosts;

  const PostReviewWithViewMoreCard(
      {Key? key, required this.userPosts, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blueColor1,
      child: ListTile(
        iconColor: AppColors.greenColor,
        leading: const Icon(Icons.subtitles, size: 30),
        title: buildPostTitleText(index, context),
        subtitle: buildPostBodyText(index, context),
        trailing: PostDetailsBtn(post: userPosts![index]!),
      ),
    );
  }

  Text buildPostTitleText(int index, BuildContext context) {
    return Text(
      userPosts![index]!.title!.getOrCrash()!,
      style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(color: AppColors.whiteColor1),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }

  Text buildPostBodyText(int index, BuildContext context) {
    return Text(
      userPosts![index]!.body!.getOrCrash()!,
      style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
