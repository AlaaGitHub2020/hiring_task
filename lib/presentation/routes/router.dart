import 'package:auto_route/annotations.dart';
import 'package:hiring_task/presentation/album_details/album_details_page.dart';
import 'package:hiring_task/presentation/new_comment_form/new_comment_form_page.dart';
import 'package:hiring_task/presentation/post_details/post_details_page.dart';
import 'package:hiring_task/presentation/user_albums/user_albums_page.dart';
import 'package:hiring_task/presentation/user_details/user_details_page.dart';
import 'package:hiring_task/presentation/user_posts/user_posts_page.dart';
import 'package:hiring_task/presentation/users/users_page.dart';

@MaterialAutoRouter(
  preferRelativeImports: true,
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: UsersPage, initial: true),
    AutoRoute(page: UserDetailsPage),
    AutoRoute(page: UserPostsPage),
    AutoRoute(page: PostDetailsPage),
    AutoRoute(page: UserAlbumsPage),
    AutoRoute(page: AlbumDetailsPage),
    AutoRoute(page: NewCommentFormPage),
  ],
)
class $AppRouter {}
