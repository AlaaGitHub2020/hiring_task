import 'package:flutter/material.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/presentation/user_posts/widgets/post_review_with_view_more_card.dart';

class UserPostsBody extends StatelessWidget {
  final List<Post?>? userPosts;

  const UserPostsBody({Key? key, required this.userPosts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userPosts!.length,
        primary: true,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return PostReviewWithViewMoreCard(index: index, userPosts: userPosts);
        });
  }
}
