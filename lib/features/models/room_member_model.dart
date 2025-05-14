import 'package:isar/isar.dart';
import 'room_member_dto.dart';

part 'room_member_model.g.dart';

@collection
class RoomMemberModel {
  Id isarId = Isar.autoIncrement;

  // roomId をインデックスの“先頭”にして composite を張る
  @Index(composite: [CompositeIndex('userId')])
  late String roomId;

  // userId 単体検索用
  @Index()
  late String userId;

  RoomMemberModel();

  /* DTO ↔ Model 変換 */
  RoomMemberModel.fromDto(RoomMemberDto dto)
      : roomId = dto.roomId,
        userId = dto.userId;

  RoomMemberDto toDto() =>
      RoomMemberDto(roomId: roomId, userId: userId);
}