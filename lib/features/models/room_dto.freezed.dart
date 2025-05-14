// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomDto _$RoomDtoFromJson(Map<String, dynamic> json) {
  return _RoomDto.fromJson(json);
}

/// @nodoc
mixin _$RoomDto {
  String get id => throw _privateConstructorUsedError;
  bool get isGroup => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  String? get dmKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomDtoCopyWith<RoomDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomDtoCopyWith<$Res> {
  factory $RoomDtoCopyWith(RoomDto value, $Res Function(RoomDto) then) =
      _$RoomDtoCopyWithImpl<$Res, RoomDto>;
  @useResult
  $Res call(
      {String id,
      bool isGroup,
      DateTime createdAt,
      String? name,
      String? lastMessage,
      DateTime lastUpdated,
      String? dmKey});
}

/// @nodoc
class _$RoomDtoCopyWithImpl<$Res, $Val extends RoomDto>
    implements $RoomDtoCopyWith<$Res> {
  _$RoomDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isGroup = null,
    Object? createdAt = null,
    Object? name = freezed,
    Object? lastMessage = freezed,
    Object? lastUpdated = null,
    Object? dmKey = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isGroup: null == isGroup
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dmKey: freezed == dmKey
          ? _value.dmKey
          : dmKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomDtoImplCopyWith<$Res> implements $RoomDtoCopyWith<$Res> {
  factory _$$RoomDtoImplCopyWith(
          _$RoomDtoImpl value, $Res Function(_$RoomDtoImpl) then) =
      __$$RoomDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isGroup,
      DateTime createdAt,
      String? name,
      String? lastMessage,
      DateTime lastUpdated,
      String? dmKey});
}

/// @nodoc
class __$$RoomDtoImplCopyWithImpl<$Res>
    extends _$RoomDtoCopyWithImpl<$Res, _$RoomDtoImpl>
    implements _$$RoomDtoImplCopyWith<$Res> {
  __$$RoomDtoImplCopyWithImpl(
      _$RoomDtoImpl _value, $Res Function(_$RoomDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isGroup = null,
    Object? createdAt = null,
    Object? name = freezed,
    Object? lastMessage = freezed,
    Object? lastUpdated = null,
    Object? dmKey = freezed,
  }) {
    return _then(_$RoomDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isGroup: null == isGroup
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dmKey: freezed == dmKey
          ? _value.dmKey
          : dmKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomDtoImpl extends _RoomDto {
  const _$RoomDtoImpl(
      {required this.id,
      required this.isGroup,
      required this.createdAt,
      this.name,
      this.lastMessage,
      required this.lastUpdated,
      this.dmKey})
      : super._();

  factory _$RoomDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomDtoImplFromJson(json);

  @override
  final String id;
  @override
  final bool isGroup;
  @override
  final DateTime createdAt;
  @override
  final String? name;
  @override
  final String? lastMessage;
  @override
  final DateTime lastUpdated;
  @override
  final String? dmKey;

  @override
  String toString() {
    return 'RoomDto(id: $id, isGroup: $isGroup, createdAt: $createdAt, name: $name, lastMessage: $lastMessage, lastUpdated: $lastUpdated, dmKey: $dmKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isGroup, isGroup) || other.isGroup == isGroup) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.dmKey, dmKey) || other.dmKey == dmKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, isGroup, createdAt, name,
      lastMessage, lastUpdated, dmKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomDtoImplCopyWith<_$RoomDtoImpl> get copyWith =>
      __$$RoomDtoImplCopyWithImpl<_$RoomDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomDtoImplToJson(
      this,
    );
  }
}

abstract class _RoomDto extends RoomDto {
  const factory _RoomDto(
      {required final String id,
      required final bool isGroup,
      required final DateTime createdAt,
      final String? name,
      final String? lastMessage,
      required final DateTime lastUpdated,
      final String? dmKey}) = _$RoomDtoImpl;
  const _RoomDto._() : super._();

  factory _RoomDto.fromJson(Map<String, dynamic> json) = _$RoomDtoImpl.fromJson;

  @override
  String get id;
  @override
  bool get isGroup;
  @override
  DateTime get createdAt;
  @override
  String? get name;
  @override
  String? get lastMessage;
  @override
  DateTime get lastUpdated;
  @override
  String? get dmKey;
  @override
  @JsonKey(ignore: true)
  _$$RoomDtoImplCopyWith<_$RoomDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
