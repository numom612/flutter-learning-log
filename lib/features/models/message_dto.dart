import 'package:freezed_annotation/freezed_annotation.dart';
import 'message_cursor.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
abstract class MessageDto with _$MessageDto {
  const MessageDto._(); // カスタムゲッター用

  const factory MessageDto({
    required String id,
    required String roomId,
    required String senderId,
    required String content,
    required DateTime createdAt,
  }) = _MessageDto;

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);

  // createdAt + id をまとめたカーソル（ページネーション用）
  MessageCursor get cursor => MessageCursor(
    createdAt: createdAt,
    id: id,
  );
}
