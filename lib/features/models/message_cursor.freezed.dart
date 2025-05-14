// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_cursor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageCursor _$MessageCursorFromJson(Map<String, dynamic> json) {
  return _MessageCursor.fromJson(json);
}

/// @nodoc
mixin _$MessageCursor {
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCursorCopyWith<MessageCursor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCursorCopyWith<$Res> {
  factory $MessageCursorCopyWith(
          MessageCursor value, $Res Function(MessageCursor) then) =
      _$MessageCursorCopyWithImpl<$Res, MessageCursor>;
  @useResult
  $Res call({DateTime createdAt, String id});
}

/// @nodoc
class _$MessageCursorCopyWithImpl<$Res, $Val extends MessageCursor>
    implements $MessageCursorCopyWith<$Res> {
  _$MessageCursorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageCursorImplCopyWith<$Res>
    implements $MessageCursorCopyWith<$Res> {
  factory _$$MessageCursorImplCopyWith(
          _$MessageCursorImpl value, $Res Function(_$MessageCursorImpl) then) =
      __$$MessageCursorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime createdAt, String id});
}

/// @nodoc
class __$$MessageCursorImplCopyWithImpl<$Res>
    extends _$MessageCursorCopyWithImpl<$Res, _$MessageCursorImpl>
    implements _$$MessageCursorImplCopyWith<$Res> {
  __$$MessageCursorImplCopyWithImpl(
      _$MessageCursorImpl _value, $Res Function(_$MessageCursorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
  }) {
    return _then(_$MessageCursorImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageCursorImpl implements _MessageCursor {
  const _$MessageCursorImpl({required this.createdAt, required this.id});

  factory _$MessageCursorImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageCursorImplFromJson(json);

  @override
  final DateTime createdAt;
  @override
  final String id;

  @override
  String toString() {
    return 'MessageCursor(createdAt: $createdAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageCursorImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, createdAt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageCursorImplCopyWith<_$MessageCursorImpl> get copyWith =>
      __$$MessageCursorImplCopyWithImpl<_$MessageCursorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageCursorImplToJson(
      this,
    );
  }
}

abstract class _MessageCursor implements MessageCursor {
  const factory _MessageCursor(
      {required final DateTime createdAt,
      required final String id}) = _$MessageCursorImpl;

  factory _MessageCursor.fromJson(Map<String, dynamic> json) =
      _$MessageCursorImpl.fromJson;

  @override
  DateTime get createdAt;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$MessageCursorImplCopyWith<_$MessageCursorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
