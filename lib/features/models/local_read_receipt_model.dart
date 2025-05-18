import 'package:isar/isar.dart';
import 'local_read_receipt_dto.dart';
part 'local_read_receipt_model.g.dart';

@collection
class LocalReadReceipt {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String roomId;
  late String lastReadMessageId;
  late DateTime updatedAt;

  LocalReadReceipt();

  // DTO → Entity
  LocalReadReceipt.fromDto(LocalReadReceiptDto dto) {
    roomId = dto.roomId;
    lastReadMessageId = dto.lastReadMessageId;
    updatedAt = dto.updatedAt;
  }

  // Entity → DTO
  LocalReadReceiptDto toDto() => LocalReadReceiptDto(
        roomId: roomId,
        lastReadMessageId: lastReadMessageId,
        updatedAt: updatedAt,
      );
}
