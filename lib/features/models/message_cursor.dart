import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_cursor.freezed.dart';
part 'message_cursor.g.dart';

@freezed
abstract class MessageCursor with _$MessageCursor {
  const factory MessageCursor({
    required DateTime createdAt,
    required String id,
  }) = _MessageCursor;

  factory MessageCursor.fromJson(Map<String, dynamic> json) =>
      _$MessageCursorFromJson(json);
}