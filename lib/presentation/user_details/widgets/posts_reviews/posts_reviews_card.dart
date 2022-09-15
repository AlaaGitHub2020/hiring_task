import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/presentation/user_details/widgets/posts_reviews/posts_reviews_list.dart';
import 'package:hiring_task/presentation/user_details/widgets/posts_reviews/user_posts_review_text.dart';
import 'package:hiring_task/presentation/user_details/widgets/posts_reviews/view_more_user_posts_btn.dart';

class PostsReviewsCard extends StatelessWidget {
  final User user;

  const PostsReviewsCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.greenColor,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserPostsReviewText(),
              PostsReviewsList(user: user),
              ViewMoreUserPostsBtn(userPosts: user.postsList),
            ],
          ),
        ));
  }
}
