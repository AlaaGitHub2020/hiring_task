import 'package:flutter/material.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';

class DetailsCard extends StatelessWidget {
  final IconData icon;
  final String cardTitle;
  final String cardSubtitle;
  final bool isPost;

  const DetailsCard({
    Key? key,
    required this.icon,
    required this.cardTitle,
    required this.cardSubtitle,
    this.isPost = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.blueColor1,
      child: ListTile(
        iconColor: AppColors.greenColor,
        leading: Icon(icon, size: 30),
        title: Text(
          cardTitle,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: AppColors.whiteColor1),
          overflow: isPost ? TextOverflow.ellipsis : null,
          maxLines: isPost ? 1 : null,
        ),
        subtitle: Text(
          cardSubtitle,
          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
          overflow: isPost ? TextOverflow.ellipsis : null,
          maxLines: isPost ? 1 : null,
        ),
      ),
    );
  }
}
