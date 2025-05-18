import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_read_receipt_dto.freezed.dart';
part 'local_read_receipt_dto.g.dart';

@freezed
class LocalReadReceiptDto with _$LocalReadReceiptDto {
  const factory LocalReadReceiptDto({
    required String roomId,
    required String lastReadMessageId,
    required DateTime updatedAt,
  }) = _LocalReadReceiptDto;

  factory LocalReadReceiptDto.fromJson(Map<String, dynamic> json) =>
      _$LocalReadReceiptDtoFromJson(json);
}