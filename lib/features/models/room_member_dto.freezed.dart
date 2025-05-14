// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomMemberDto _$RoomMemberDtoFromJson(Map<String, dynamic> json) {
  return _RoomMemberDto.fromJson(json);
}

/// @nodoc
mixin _$RoomMemberDto {
  String get roomId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomMemberDtoCopyWith<RoomMemberDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomMemberDtoCopyWith<$Res> {
  factory $RoomMemberDtoCopyWith(
          RoomMemberDto value, $Res Function(RoomMemberDto) then) =
      _$RoomMemberDtoCopyWithImpl<$Res, RoomMemberDto>;
  @useResult
  $Res call({String roomId, String userId});
}

/// @nodoc
class _$RoomMemberDtoCopyWithImpl<$Res, $Val extends RoomMemberDto>
    implements $RoomMemberDtoCopyWith<$Res> {
  _$RoomMemberDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomMemberDtoImplCopyWith<$Res>
    implements $RoomMemberDtoCopyWith<$Res> {
  factory _$$RoomMemberDtoImplCopyWith(
          _$RoomMemberDtoImpl value, $Res Function(_$RoomMemberDtoImpl) then) =
      __$$RoomMemberDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomId, String userId});
}

/// @nodoc
class __$$RoomMemberDtoImplCopyWithImpl<$Res>
    extends _$RoomMemberDtoCopyWithImpl<$Res, _$RoomMemberDtoImpl>
    implements _$$RoomMemberDtoImplCopyWith<$Res> {
  __$$RoomMemberDtoImplCopyWithImpl(
      _$RoomMemberDtoImpl _value, $Res Function(_$RoomMemberDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
  }) {
    return _then(_$RoomMemberDtoImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomMemberDtoImpl extends _RoomMemberDto {
  const _$RoomMemberDtoImpl({required this.roomId, required this.userId})
      : super._();

  factory _$RoomMemberDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomMemberDtoImplFromJson(json);

  @override
  final String roomId;
  @override
  final String userId;

  @override
  String toString() {
    return 'RoomMemberDto(roomId: $roomId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomMemberDtoImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomMemberDtoImplCopyWith<_$RoomMemberDtoImpl> get copyWith =>
      __$$RoomMemberDtoImplCopyWithImpl<_$RoomMemberDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomMemberDtoImplToJson(
      this,
    );
  }
}

abstract class _RoomMemberDto extends RoomMemberDto {
  const factory _RoomMemberDto(
      {required final String roomId,
      required final String userId}) = _$RoomMemberDtoImpl;
  const _RoomMemberDto._() : super._();

  factory _RoomMemberDto.fromJson(Map<String, dynamic> json) =
      _$RoomMemberDtoImpl.fromJson;

  @override
  String get roomId;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$RoomMemberDtoImplCopyWith<_$RoomMemberDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
