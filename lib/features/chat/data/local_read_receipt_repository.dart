import 'package:isar/isar.dart';
import '../../models/local_read_receipt_model.dart';

class LocalReadReceiptRepository {
  final Isar _isar;
  LocalReadReceiptRepository(this._isar);

  // 既読取得
  Future<String?> getLastReadMessageId(String roomId) async {
    final receipt =
        await _isar.localReadReceipts.where().roomIdEqualTo(roomId).findFirst();
    return receipt?.lastReadMessageId;
  }

  // 既読更新（新しいメッセージまで既読に）
  Future<void> setLastReadMessageId(String roomId, String messageId) async {
    await _isar.writeTxn(() async {
      var receipt = await _isar.localReadReceipts
          .where()
          .roomIdEqualTo(roomId)
          .findFirst();

      if (receipt == null) {
        receipt = LocalReadReceipt()
          ..roomId = roomId
          ..lastReadMessageId = messageId
          ..updatedAt = DateTime.now();
        await _isar.localReadReceipts.put(receipt);
      } else {
        receipt.lastReadMessageId = messageId;
        receipt.updatedAt = DateTime.now();
        await _isar.localReadReceipts.put(receipt);
      }
    });
  }

  // 既読情報削除（例：room退会時など）
  Future<void> deleteByRoomId(String roomId) async {
    await _isar.writeTxn(() async {
      final receipt = await _isar.localReadReceipts
          .where()
          .roomIdEqualTo(roomId)
          .findFirst();
      if (receipt != null) {
        await _isar.localReadReceipts.delete(receipt.isarId);
      }
    });
  }
}
