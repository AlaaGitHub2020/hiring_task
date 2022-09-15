import 'package:flutter/material.dart';
import 'package:hiring_task/application/posts/post_details_bloc.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/generated/l10n.dart';

class PostDetailsCard extends StatelessWidget {
  final PostDetailsFetched success;

  const PostDetailsCard({Key? key, required this.success}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blueColor1,
      child: ListTile(
        leading: buildLeading(context),
        title: buildPostTitleText(context),
        subtitle: buildPostBodyText(context),
      ),
    );
  }

  Column buildLeading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildUserIdText(context),
        buildPostIdText(context),
      ],
    );
  }

  Text buildUserIdText(BuildContext context) {
    return Text(
      "${S.of(context).userId}${success.post.userId!.getOrCrash()!}",
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Text buildPostIdText(BuildContext context) {
    return Text(
      "${S.of(context).postId}${success.post.id!.getOrCrash()!}",
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Text buildPostTitleText(BuildContext context) {
    return Text(
      "${S.of(context).postTitle}${success.post.title!.getOrCrash()!}",
      style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(color: AppColors.whiteColor1),
    );
  }

  Text buildPostBodyText(BuildContext context) {
    return Text(
      "${S.of(context).postBody}${success.post.body!.getOrCrash()!}",
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
