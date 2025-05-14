import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../features/models/message_dto.dart' show MessageDto;
import '../features/models/message_model.dart' show MessageModel;
import '../features/models/message_cursor.dart' show MessageCursor;
import '../features/models/room_dto.dart' show RoomDto;
import '../features/models/room_member_dto.dart' show RoomMemberDto;

class SupabaseService {
  final SupabaseClient _client;
  final Connectivity _connectivity = Connectivity();

  SupabaseService(this._client);

  /// ネットワーク接続の有無
  Future<bool> isOnline() async {
    final result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  /// メッセージを Supabase にアップロード
  Future<void> uploadMessage(MessageDto dto) async {
    await _client.from('messages').insert(dto.toJson());
  }

  /// 指定ルームのメッセージをストリームで取得
  Stream<List<MessageModel>> streamMessages(String roomId) {
    return _client
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('room_id', roomId)
        .order('created_at')
        .map(
          (rows) => rows
              .map<MessageModel>(
                (r) => MessageModel.fromDto(MessageDto.fromJson(r)),
              )
              .toList(),
        );
  }

  /// 過去メッセージを一括取得（ページングなどに活用）
  Future<List<MessageModel>> fetchOlderMessages(
      String roomId, MessageCursor cursor) async {
    final rows = await _client
        .from('messages')
        .select()
        .eq('room_id', roomId)
        // created_at が cursor よりも前 OR 同時刻で id が cursor.id より小さいもの
        .or('created_at.lt.${cursor.createdAt.toIso8601String()},and(created_at.eq.${cursor.createdAt.toIso8601String()},id.lt.${cursor.id})')
        .order('created_at', ascending: false)
        .order('id', ascending: false)
        .limit(20);

    return rows
        .map<MessageModel>((r) => MessageModel.fromDto(MessageDto.fromJson(r)))
        .toList()
        .reversed
        .toList(); // 古い順（チャットの上から下）に並べ直す
  }

  Future<String> createRoom({
    required bool isGroup,
    required List<String> userIds,
    String? name,
  }) async {
    // DM キー作成（昇順）
    String? dmKey;
    if (!isGroup && userIds.length == 2) {
      final sorted = List.of(userIds)..sort();
      dmKey = '${sorted[0]}_${sorted[1]}';
    }

    final now = DateTime.now();

    // Supabase にルームを挿入し、生成された ID を取得
    final inserted = await _client
        .from('rooms')
        .insert({
          'is_group': isGroup,
          'created_at': now.toIso8601String(),
          'last_updated': now.toIso8601String(),
          'name': name,
          'dm_key': dmKey,
        })
        .select('id')
        .single();

    final roomId = inserted['id'] as String;

    // ルームメンバーを挿入
    final memberDtos = userIds
        .map((uid) => RoomMemberDto(roomId: roomId, userId: uid).toJson())
        .toList();

    await _client.from('room_members').insert(memberDtos);

    return roomId;
  }

  Future<List<RoomDto>> fetchRoomList(String userId) async {
    final memberRows = await _client
        .from('room_members')
        .select('room_id')
        .eq('user_id', userId);

    final roomIds = memberRows.map((r) => r['room_id'] as String).toList();
    if (roomIds.isEmpty) return [];

    final roomData = await _client
        .from('rooms')
        .select(
            'id, name, is_group, created_at, last_updated, dm_key, messages!rooms_id_fkey(id, created_at, content, sender_id)')
        .inFilter('id', roomIds)
        .order('last_updated', ascending: false);

    return roomData.map<RoomDto>((r) {
      final latest =
          (r['messages'] as List).isNotEmpty ? r['messages'].last : null;

      return RoomDto(
        id: r['id'],
        isGroup: r['is_group'],
        createdAt: DateTime.parse(r['created_at']),
        lastUpdated: DateTime.parse(r['last_updated']),
        name: r['name'],
        dmKey: r['dm_key'],
        lastMessage: latest != null ? latest['content'] : null,
      );
    }).toList();
  }
}
