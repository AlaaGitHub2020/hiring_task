import 'package:flutter/material.dart';
import 'package:hiring_task/application/posts/post_details_bloc.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/generated/l10n.dart';

class AllCommentsList extends StatelessWidget {
  final PostDetailsFetched success;

  const AllCommentsList({Key? key, required this.success}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      physics: const BouncingScrollPhysics(),
      itemCount: success.post.commentsList!.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: AppColors.greenColor.withOpacity(0.7),
          child: ListTile(
            title: buildTitle(context, index),
            subtitle: buildBodyText(context, index),
          ),
        );
      },
    );
  }

  Column buildTitle(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildNameText(context, index),
        buildEmailText(context, index),
      ],
    );
  }

  Text buildNameText(BuildContext context, int index) {
    return Text(
      "${S.of(context).name}${success.post.commentsList![index]!.name!.getOrCrash()!}",
      style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(color: AppColors.whiteColor1),
    );
  }

  Text buildEmailText(BuildContext context, int index) {
    return Text(
      "${S.of(context).email}${success.post.commentsList![index]!.email!.getOrCrash()!}",
      style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(color: AppColors.whiteColor1),
    );
  }

  Text buildBodyText(BuildContext context, int index) {
    return Text(
      "${S.of(context).body}${success.post.commentsList![index]!.body!.getOrCrash()!}",
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
