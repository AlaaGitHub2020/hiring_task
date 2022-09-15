import 'package:flutter/material.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/generated/l10n.dart';
import 'package:hiring_task/presentation/user_albums/widgets/user_albums_body.dart';

class UserAlbumsPage extends StatelessWidget {
  final List<Album?>? userAlbums;

  const UserAlbumsPage({Key? key, required this.userAlbums}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).usersAlbums)),
      body: UserAlbumsBody(userAlbums: userAlbums),
    );
  }
}
