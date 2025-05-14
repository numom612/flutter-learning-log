// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomDtoImpl _$$RoomDtoImplFromJson(Map<String, dynamic> json) =>
    _$RoomDtoImpl(
      id: json['id'] as String,
      isGroup: json['isGroup'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String?,
      lastMessage: json['lastMessage'] as String?,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      dmKey: json['dmKey'] as String?,
    );

Map<String, dynamic> _$$RoomDtoImplToJson(_$RoomDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isGroup': instance.isGroup,
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
      'lastMessage': instance.lastMessage,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'dmKey': instance.dmKey,
    };
