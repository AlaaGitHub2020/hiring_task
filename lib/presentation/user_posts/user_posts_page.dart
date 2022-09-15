import 'package:flutter/material.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/presentation/user_posts/widgets/user_posts_body.dart';

class UserPostsPage extends StatelessWidget {
  final List<Post?>? userPosts;

  const UserPostsPage({Key? key, required this.userPosts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).usersPosts)),
      body: UserPostsBody(userPosts: userPosts),
    );
  }
}
