import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_member_dto.freezed.dart';
part 'room_member_dto.g.dart';

@freezed
abstract class RoomMemberDto with _$RoomMemberDto {
  const RoomMemberDto._();

  const factory RoomMemberDto({
    required String roomId,
    required String userId,
  }) = _RoomMemberDto;

  factory RoomMemberDto.fromJson(Map<String, dynamic> json) =>
      _$RoomMemberDtoFromJson(json);
}