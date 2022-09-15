import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_task/application/posts/post_details_bloc.dart';
import 'package:hiring_task/presentation/post_details/widgets/add_comment_btn.dart';
import 'package:hiring_task/presentation/post_details/widgets/all_comments_list.dart';
import 'package:hiring_task/presentation/post_details/widgets/all_comments_text.dart';
import 'package:hiring_task/presentation/post_details/widgets/post_details_card.dart';
import 'package:hiring_task/presentation/post_details/widgets/post_details_custom_error_widget.dart';
import 'package:hiring_task/presentation/post_details/widgets/post_details_text.dart';

class PostDetailsBody extends StatefulWidget {
  final String postId;

  const PostDetailsBody({Key? key, required this.postId}) : super(key: key);

  @override
  State<PostDetailsBody> createState() => _PostDetailsBodyState();
}

class _PostDetailsBodyState extends State<PostDetailsBody> {
  @override
  void initState() {
    context
        .read<PostDetailsBloc>()
        .add(PostDetailsEvent.getPostDetails(widget.postId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsBloc, PostDetailsState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          postDetailsFailure: (failure) =>
              PostDetailsCustomErrorWidget(failure: failure),
          postDetailsFetched: (success) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PostDetailsText(),
                  PostDetailsCard(success: success),
                  const AllCommentsText(),
                  AllCommentsList(success: success),
                  AddCommentBtn(postId: success.post.id!.getOrCrash()!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
