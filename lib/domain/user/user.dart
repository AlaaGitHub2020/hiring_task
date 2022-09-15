import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/core/entity.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/user/address/address.dart';
import 'package:hiring_task/domain/user/company/company.dart';
import 'package:hiring_task/domain/user/value_objects.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User implements IEntity {
  const factory User({
    UniqueId? id,
    Name? name,
    Username? username,
    Email? email,
    Address? address,
    Phone? phone,
    Website? website,
    Company? company,
    List<Post?>? postsList,
    List<Album?>? albumsList,
  }) = _User;

  factory User.empty() => User(
        id: UniqueId(0),
        name: Name(''),
        username: Username(''),
        email: Email(''),
        address: Address.empty(),
        phone: Phone(''),
        website: Website(''),
        company: Company.empty(),
        postsList: [],
        albumsList: [],
      );
}
