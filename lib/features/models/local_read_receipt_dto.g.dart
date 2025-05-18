// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_read_receipt_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalReadReceiptDtoImpl _$$LocalReadReceiptDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$LocalReadReceiptDtoImpl(
      roomId: json['roomId'] as String,
      lastReadMessageId: json['lastReadMessageId'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$LocalReadReceiptDtoImplToJson(
        _$LocalReadReceiptDtoImpl instance) =>
    <String, dynamic>{
      'roomId': instance.roomId,
      'lastReadMessageId': instance.lastReadMessageId,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
