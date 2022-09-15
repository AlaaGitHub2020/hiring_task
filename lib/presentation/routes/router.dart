import 'package:auto_route/annotations.dart';
import 'package:hiring_task/presentation/user_details/user_details_page.dart';
import 'package:hiring_task/presentation/users/users_page.dart';

@MaterialAutoRouter(
  preferRelativeImports: true,
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: UsersPage, initial: true),
    AutoRoute(page: UserDetailsPage),
  ],
)
class $AppRouter {}
