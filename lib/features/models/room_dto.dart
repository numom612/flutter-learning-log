import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_dto.freezed.dart';
part 'room_dto.g.dart';

@freezed
abstract class RoomDto with _$RoomDto {
  const RoomDto._();

  const factory RoomDto({
    required String id,
    required bool isGroup,
    required DateTime createdAt,
    String? name,
    String? lastMessage,
    required DateTime lastUpdated,
    String? dmKey, // 一対一チャットならユーザーID2つの昇順結合
  }) = _RoomDto;

  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);
}