import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiring_task/domain/album/album.dart';
import 'package:hiring_task/domain/core/value_objects.dart';
import 'package:hiring_task/domain/post/post.dart';
import 'package:hiring_task/domain/user/address/address.dart';
import 'package:hiring_task/domain/user/company/company.dart';
import 'package:hiring_task/domain/user/user.dart';
import 'package:hiring_task/domain/user/value_objects.dart';
import 'package:hiring_task/infrastructure/album/album_converter.dart';
import 'package:hiring_task/infrastructure/album/album_data_transfer_object.dart';
import 'package:hiring_task/infrastructure/post/post_converter.dart';
import 'package:hiring_task/infrastructure/post/post_data_transfer_object.dart';
import 'package:hiring_task/infrastructure/user/address/address_converter.dart';
import 'package:hiring_task/infrastructure/user/address/address_data_transfer_object.dart';
import 'package:hiring_task/infrastructure/user/company/company_converter.dart';
import 'package:hiring_task/infrastructure/user/company/company_data_transfer_object.dart';

part 'user_data_transfer_object.freezed.dart';
part 'user_data_transfer_object.g.dart';

///Dto: data transfer object
@freezed
abstract class UserDto with _$UserDto {
  factory UserDto({
    int? id,
    String? name,
    String? username,
    String? email,
    @AddressConverter() Address? address,
    String? phone,
    String? website,
    @CompanyConverter() Company? company,
    @PostConverter() List<Post?>? postsList,
    @AlbumConverter() List<Album?>? albumsList,
  }) = _UserDto;

  factory UserDto.fromDomain(User? user) {
    return UserDto(
      id: user!.id!.getOrCrash(),
      name: user.name!.getOrCrash(),
      username: user.username!.getOrCrash(),
      email: user.email!.getOrCrash(),
      address: user.address,
      phone: user.phone!.getOrCrash(),
      website: user.website!.getOrCrash(),
      company: user.company,
      postsList: user.postsList,
      albumsList: user.albumsList,
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);
}

extension UserDtoX on UserDto {
  User? toDomain() {
    List<Post?>? thePostsList = [];
    if (postsList != null) {
      for (int x = 0; x < postsList!.length; x++) {
        thePostsList.add(PostDto.fromDomain(postsList![x]).toDomain()!);
      }
    }
    List<Album?>? theAlbumsList = [];
    if (postsList != null) {
      for (int x = 0; x < albumsList!.length; x++) {
        theAlbumsList.add(AlbumDto.fromDomain(albumsList![x]).toDomain()!);
      }
    }
    return User(
      id: UniqueId(id),
      name: Name(name),
      username: Username(username),
      email: Email(email),
      address: AddressDto.fromDomain(address).toDomain(),
      phone: Phone(phone),
      website: Website(website),
      company: CompanyDto.fromDomain(company).toDomain(),
      postsList: thePostsList,
      albumsList: theAlbumsList,
    );
  }
}
