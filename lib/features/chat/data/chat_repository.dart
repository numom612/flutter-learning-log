import '../../models/message_dto.dart' show MessageDto;
import '../../models/message_model.dart' show MessageModel;
import '../../models/message_cursor.dart' show MessageCursor;
import '../../../services/isar_service.dart';
import '../../../services/supabase_service.dart';

class ChatRepository {
  final IsarService _isar;
  final SupabaseService _supabase;

  ChatRepository(this._isar, this._supabase);

  Future<void> sendMessage(MessageDto dto) async {
    // DTO → Entity に変換

    if (await _supabase.isOnline()) {
      await _supabase.uploadMessage(dto);
    }
    final entity = MessageModel.fromDto(dto);
    await _isar.saveMessage(entity);
  }

  Future<List<MessageModel>> fetchLocalMessages(
    String roomId,
    MessageCursor? cursor,
  ) async {
    return await _isar.fetchRoomMessages(roomId: roomId, cursor: cursor);
  }

  Stream<List<MessageModel>> streamMessages(String roomId) {
    return _supabase.streamMessages(roomId);
  }

  Future<List<MessageModel>> fetchLatestMessagesByRoom({
    int limit = 50,
    DateTime? before,
  }) async {
    // 'before' parameter isn't supported by IsarService, so it's ignored
    return await _isar.fetchLatestMessagesByRoom(limit: limit);
  }

  Future<void> deleteMessage(int isarId) async {
    await _isar.deleteMessage(isarId);
  }
}
