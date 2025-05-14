import 'package:isar/isar.dart';
import 'room_dto.dart';

part 'room_model.g.dart';

@collection
class RoomModel {
  RoomModel();

  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String id; // Supabase UUID

  late bool isGroup;
  late DateTime createdAt;
  String? name;
  String? lastMessage;
  late DateTime lastUpdated;

  // 一対一DM識別用（昇順ソートしたuserIdの結合文字列）
  @Index(unique: true, replace: true)
  String? dmKey;

  RoomModel.fromDto(RoomDto dto) {
    id = dto.id;
    isGroup = dto.isGroup;
    createdAt = dto.createdAt;
    name = dto.name;
    lastMessage = dto.lastMessage;
    lastUpdated = dto.lastUpdated;
    dmKey = dto.dmKey;
  }

  RoomDto toDto() => RoomDto(
        id: id,
        isGroup: isGroup,
        createdAt: createdAt,
        name: name,
        lastMessage: lastMessage,
        lastUpdated: lastUpdated,
        dmKey: dmKey,
      );
}