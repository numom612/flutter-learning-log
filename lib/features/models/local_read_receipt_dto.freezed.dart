// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_read_receipt_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalReadReceiptDto _$LocalReadReceiptDtoFromJson(Map<String, dynamic> json) {
  return _LocalReadReceiptDto.fromJson(json);
}

/// @nodoc
mixin _$LocalReadReceiptDto {
  String get roomId => throw _privateConstructorUsedError;
  String get lastReadMessageId => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalReadReceiptDtoCopyWith<LocalReadReceiptDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalReadReceiptDtoCopyWith<$Res> {
  factory $LocalReadReceiptDtoCopyWith(
          LocalReadReceiptDto value, $Res Function(LocalReadReceiptDto) then) =
      _$LocalReadReceiptDtoCopyWithImpl<$Res, LocalReadReceiptDto>;
  @useResult
  $Res call({String roomId, String lastReadMessageId, DateTime updatedAt});
}

/// @nodoc
class _$LocalReadReceiptDtoCopyWithImpl<$Res, $Val extends LocalReadReceiptDto>
    implements $LocalReadReceiptDtoCopyWith<$Res> {
  _$LocalReadReceiptDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? lastReadMessageId = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      lastReadMessageId: null == lastReadMessageId
          ? _value.lastReadMessageId
          : lastReadMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalReadReceiptDtoImplCopyWith<$Res>
    implements $LocalReadReceiptDtoCopyWith<$Res> {
  factory _$$LocalReadReceiptDtoImplCopyWith(_$LocalReadReceiptDtoImpl value,
          $Res Function(_$LocalReadReceiptDtoImpl) then) =
      __$$LocalReadReceiptDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomId, String lastReadMessageId, DateTime updatedAt});
}

/// @nodoc
class __$$LocalReadReceiptDtoImplCopyWithImpl<$Res>
    extends _$LocalReadReceiptDtoCopyWithImpl<$Res, _$LocalReadReceiptDtoImpl>
    implements _$$LocalReadReceiptDtoImplCopyWith<$Res> {
  __$$LocalReadReceiptDtoImplCopyWithImpl(_$LocalReadReceiptDtoImpl _value,
      $Res Function(_$LocalReadReceiptDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? lastReadMessageId = null,
    Object? updatedAt = null,
  }) {
    return _then(_$LocalReadReceiptDtoImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      lastReadMessageId: null == lastReadMessageId
          ? _value.lastReadMessageId
          : lastReadMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalReadReceiptDtoImpl implements _LocalReadReceiptDto {
  const _$LocalReadReceiptDtoImpl(
      {required this.roomId,
      required this.lastReadMessageId,
      required this.updatedAt});

  factory _$LocalReadReceiptDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalReadReceiptDtoImplFromJson(json);

  @override
  final String roomId;
  @override
  final String lastReadMessageId;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'LocalReadReceiptDto(roomId: $roomId, lastReadMessageId: $lastReadMessageId, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalReadReceiptDtoImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.lastReadMessageId, lastReadMessageId) ||
                other.lastReadMessageId == lastReadMessageId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, roomId, lastReadMessageId, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalReadReceiptDtoImplCopyWith<_$LocalReadReceiptDtoImpl> get copyWith =>
      __$$LocalReadReceiptDtoImplCopyWithImpl<_$LocalReadReceiptDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalReadReceiptDtoImplToJson(
      this,
    );
  }
}

abstract class _LocalReadReceiptDto implements LocalReadReceiptDto {
  const factory _LocalReadReceiptDto(
      {required final String roomId,
      required final String lastReadMessageId,
      required final DateTime updatedAt}) = _$LocalReadReceiptDtoImpl;

  factory _LocalReadReceiptDto.fromJson(Map<String, dynamic> json) =
      _$LocalReadReceiptDtoImpl.fromJson;

  @override
  String get roomId;
  @override
  String get lastReadMessageId;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$LocalReadReceiptDtoImplCopyWith<_$LocalReadReceiptDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
