import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/presentation/user_details/widgets/albums_reviews/albums_reviews_list.dart';
import 'package:hiring_task/presentation/user_details/widgets/albums_reviews/user_albums_review_text.dart';
import 'package:hiring_task/presentation/user_details/widgets/albums_reviews/view_more_user_albums_btn.dart';

class AlbumsReviewsCard extends StatelessWidget {
  final User user;

  const AlbumsReviewsCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColors.greenColor,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserAlbumsReviewText(),
              AlbumsReviewsList(user: user),
              ViewMoreUserAlbumsBtn(userAlbums: user.albumsList),
            ],
          ),
        ));
  }
}
