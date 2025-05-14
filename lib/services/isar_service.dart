// lib/services/isar_service.dart
import 'package:isar/isar.dart';
import '../../features/models/message_model.dart';
import '../../features/models/message_cursor.dart';

class IsarService {
  final Isar _isar;
  IsarService(this._isar);

  /* ---------------------------- C R U D ----------------------------- */

  Future<void> saveMessage(MessageModel msg) async =>
      _isar.writeTxn(() => _isar.messageModels.put(msg));

  Future<void> deleteMessage(int isarId) async =>
      _isar.writeTxn(() => _isar.messageModels.delete(isarId));

  Future<void> deleteRoomMessages(String roomId) async =>
      _isar.writeTxn(() async {
        final ids = await _isar.messageModels
            .filter()
            .roomIdEqualTo(roomId)
            .isarIdProperty()
            .findAll();
        await _isar.messageModels.deleteAll(ids);
      });

  Future<List<MessageModel>> fetchLatestMessagesByRoom({int limit = 20}) async {
    return _isar.messageModels
        .where(sort: Sort.desc)           // traverse index backwards
        .anyRoomId()                      // use [roomId,createdAt,id] index
        .distinctByRoomId()               // keep first (= newest) per room
        .limit(limit)
        .findAll();
  }

  /* ----------------- 2️⃣  paging inside a single room ---------------- */

  Future<List<MessageModel>> fetchRoomMessages({
  required String roomId,
  MessageCursor? cursor,
  int limit = 50,
}) async {
  // ① 初回ロード (cursor == null) ── 最新→過去 順で limit 件
  if (cursor == null) {
    return _isar.messageModels
        .where(sort: Sort.desc)
        .roomIdEqualTo(roomId)          // ← 単一 index を利用
        .limit(limit)
        .findAll();
  }

  // ② createdAt が cursor より古いメッセージ
  final olderByDate = _isar.messageModels
      .where(sort: Sort.desc)
      .roomIdEqualToCreatedAtLessThanAnyId(roomId, cursor.createdAt)
      .limit(limit)
      .findAll();

  // ③ 同じ createdAt で id が cursor より小さいメッセージ
  final sameTimeOlderId = _isar.messageModels
      .where(sort: Sort.desc)
      .roomIdEqualToCreatedAtEqualToIdLessThan(
          roomId, cursor.createdAt, cursor.id)
      .limit(limit)
      .findAll();

  // ④ マージして返却（desc のまま）
  final merged = [
    ...await olderByDate,
    ...await sameTimeOlderId,
  ];

  return merged.take(limit).toList();
}

}
