// lib/features/models/message_model.dart
import 'package:isar/isar.dart';
import 'message_dto.dart';
import 'message_cursor.dart';

part 'message_model.g.dart';

@collection
class MessageModel {
  MessageModel();

  /// internal Isar primary key – auto‑increment keeps it fast & compact
  Id isarId = Isar.autoIncrement;

  /// globally unique UUID coming from the server / client
  @Index(unique: true, replace: true)
  late String id;

  /// ❶ roomId is the **leading segment** of the composite index
  /// ❷ createdAt ❸ id follow to enable cursor‑based paging
  ///    → `.roomIdEqualTo() → .createdAtLessThan()` & friends are generated
  @Index()
  @Index(composite: [CompositeIndex('createdAt'), CompositeIndex('id')])
  late String roomId;

  /// single‑field index is handy for occasional ad‑hoc queries
  @Index()
  late DateTime createdAt;

  late String content;
  late String senderId;

  /* ------------------------------------------------------------------ */
  /*  Convenience helpers                                               */
  /* ------------------------------------------------------------------ */

  // DTO → Entity
  MessageModel.fromDto(MessageDto dto) {
    id = dto.id;
    roomId = dto.roomId;
    senderId = dto.senderId;
    content = dto.content;
    createdAt = dto.createdAt;
  }

  // Entity → DTO
  MessageDto toDto() => MessageDto(
    id: id,
    roomId: roomId,
    senderId: senderId,
    content: content,
    createdAt: createdAt,
  );

  /// Cursor used by the repository for key‑set‑pagination (no @Index needed)
  @ignore
  MessageCursor get cursor => MessageCursor(createdAt: createdAt, id: id);
}
