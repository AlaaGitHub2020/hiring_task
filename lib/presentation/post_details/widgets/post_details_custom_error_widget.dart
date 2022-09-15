import 'package:flutter/material.dart';
import 'package:hiring_task/application/posts/post_details_bloc.dart';
import 'package:hiring_task/domain/core/utilities/colors.dart';
import 'package:hiring_task/generated/l10n.dart';

class PostDetailsCustomErrorWidget extends StatelessWidget {
  final PostDetailsFailure failure;

  const PostDetailsCustomErrorWidget({Key? key, required this.failure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        failure.postsFailure.maybeMap(
          getPostDetailsFailure: (_) => S.of(context).getPostDetailsFailure,
          orElse: () => S.of(context).unexpected,
        ),
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: AppColors.redColor1),
        textAlign: TextAlign.center,
      ),
    );
  }
}
