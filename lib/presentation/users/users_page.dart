import 'package:flutter/material.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/injection.dart';
import 'package:hiring_task/presentation/users/widgets/users_body.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return buildUsersPage(context);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Scaffold buildUsersPage(context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).usersList)),
      body: const UsersBody(),
    );
  }
}
