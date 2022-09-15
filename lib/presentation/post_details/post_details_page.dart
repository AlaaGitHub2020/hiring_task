import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/presentation/post_details/widgets/post_details_body.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;

  const PostDetailsPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title!.getOrCrash()!,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColors.whiteColor1)),
      ),
      body: PostDetailsBody(postId: post.id!.getOrCrash().toString()),
    );
  }
}
