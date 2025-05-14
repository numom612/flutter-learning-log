// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_cursor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageCursorImpl _$$MessageCursorImplFromJson(Map<String, dynamic> json) =>
    _$MessageCursorImpl(
      createdAt: DateTime.parse(json['createdAt'] as String),
      id: json['id'] as String,
    );

Map<String, dynamic> _$$MessageCursorImplToJson(_$MessageCursorImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };
