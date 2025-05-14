import 'dart:async';
import 'package:chatapp/features/chat/data/chat_repository.dart';
import 'package:chatapp/features/models/message_dto.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/message_model.dart';
import '../../models/message_cursor.dart';
import './chat_repository_provider.dart';
import '../../../core/constants/net_status.dart';

class ChatRoomState {
  final List<MessageModel> messages;
  final bool hasMore;
  final MessageCursor? lastCursor;
  final NetStatus status;

  const ChatRoomState({
    this.messages = const [],
    this.hasMore = true,
    this.lastCursor,
    this.status = const NetIdle(),
  });

  ChatRoomState copyWith({
    List<MessageModel>? messages,
    bool? hasMore,
    MessageCursor? lastCursor,
    NetStatus? status,
  }) {
    return ChatRoomState(
      messages: messages ?? this.messages,
      hasMore: hasMore ?? this.hasMore,
      lastCursor: lastCursor ?? this.lastCursor,
      status: status ?? this.status,
    );
  }

  bool get isLoading => status is NetLoading;
  bool get isIdle => status is NetIdle;
  bool get hasError => status is NetError;

  String? get errorMessage =>
      status is NetError ? (status as NetError).error.toString() : null;

  /// フェッチ可能かどうかを 1つのゲッターで管理
  bool get canFetchMore => !isLoading && hasMore;
}

class ChatRoomController
    extends AutoDisposeFamilyAsyncNotifier<ChatRoomState, String> {
  late final String _roomId;
  ChatRepository get _repo => ref.read(chatRepositoryProvider);
  StreamSubscription<List<MessageModel>>? _subscription;

  @override
  Future<ChatRoomState> build(String arg) async {
    _roomId = arg;

    final local = await _guard(() => _repo.fetchLocalMessages(_roomId, null));

    _subscription?.cancel();
    _subscription = _repo.streamMessages(_roomId).listen((remote) {
      final currentState = state.valueOrNull ?? const ChatRoomState();
      state = AsyncData(
        currentState.copyWith(
          messages: remote,
          lastCursor: remote.isEmpty ? null : remote.last.cursor,
        ),
      );
    }, onError: (e, st) {
      _updateStatus(NetError(e, st));
    });

    ref.onDispose(() {
      _subscription?.cancel();
    });

    return ChatRoomState(
      messages: local,
      lastCursor: local.isEmpty ? null : local.last.cursor,
    );
  }

  Future<void> fetchMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.canFetchMore) return;

    state = AsyncData(current.copyWith(status: const NetLoading()));

    try {
      final older = await _repo.fetchLocalMessages(_roomId, current.lastCursor);

      final newCursor = older.isEmpty ? current.lastCursor : older.last.cursor;

      final updatedState = current.copyWith(
        messages: [...current.messages, ...older],
        lastCursor: newCursor,
        hasMore: older.length >= 20,
        status: const NetIdle(),
      );

      state = AsyncData(updatedState);
    } catch (e, st) {
      state = AsyncData(current.copyWith(status: NetError(e, st)));
    }
  }

  Future<void> sendMessage(MessageDto dto) async {
    await _guard(() => _repo.sendMessage(dto));

    final current = state.valueOrNull;
    if (current != null) {
      final newMessage = MessageModel.fromDto(dto);
      state = AsyncData(
        current.copyWith(
          messages: [newMessage, ...current.messages],
          lastCursor: newMessage.cursor, // ← ここで更新してもOK
        ),
      );
    }
  }

  Future<T> _guard<T>(Future<T> Function() task) async {
    _updateStatus(const NetLoading());
    try {
      final result = await task();
      _updateStatus(const NetIdle());
      return result;
    } catch (e, st) {
      _updateStatus(NetError(e, st));
      rethrow;
    }
  }

  void _updateStatus(NetStatus status) {
    final current = state.valueOrNull;
    if (current != null) {
      state = AsyncData(current.copyWith(status: status));
    }
  }
}

final chatRoomControllerProvider = AsyncNotifierProvider.autoDispose
    .family<ChatRoomController, ChatRoomState, String>(ChatRoomController.new);
