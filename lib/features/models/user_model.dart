import 'package:isar/isar.dart';
import 'user_dto.dart'; // 実際のパスに合わせて変更してください

part 'user_model.g.dart';

@collection
class UserModel {
  UserModel();
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String id; // SupabaseのユーザーID

  late String email;
  late String password;
  late String userName;
  String? bio;
  String? iconUrl;

  DateTime updatedAt = DateTime.now();

  /// DTOからの変換
  UserModel.fromDto(UserDto dto) {
    id = dto.id;
    email = dto.email;
    password = dto.password;
    userName = dto.userName;
    bio = dto.bio;
    iconUrl = dto.iconUrl;
    updatedAt = DateTime.now();
  }

  /// DTOへの変換
  UserDto toDto() {
    return UserDto(
      id: id,
      email: email,
      password: password,
      userName: userName,
      bio: bio,
      iconUrl: iconUrl,
    );
  }
}
