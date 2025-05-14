import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/message_model.dart';
import '../../../core/constants/net_status.dart';
import './chat_repository_provider.dart';

class RoomListState {
  final List<MessageModel> rooms;
  final bool hasMore;
  final DateTime? lastTimestamp;
  final NetStatus status;

  const RoomListState({
    this.rooms = const [],
    this.hasMore = true,
    this.lastTimestamp,
    this.status = const NetIdle(),
  });

  RoomListState copyWith({
    List<MessageModel>? rooms,
    bool? hasMore,
    DateTime? lastTimestamp,
    NetStatus? status,
  }) {
    return RoomListState(
      rooms: rooms ?? this.rooms,
      hasMore: hasMore ?? this.hasMore,
      lastTimestamp: lastTimestamp ?? this.lastTimestamp,
      status: status ?? this.status,
    );
  }

  bool get isLoading => status is NetLoading;
  bool get hasError => status is NetError;
  String? get errorMessage =>
      status is NetError ? (status as NetError).error.toString() : null;
}

class ChatRoomListController extends AutoDisposeAsyncNotifier<RoomListState> {
  static const int _pageSize = 50;

  @override
  Future<RoomListState> build() async {
    return await _loadInitialRooms();
  }

  Future<RoomListState> _loadInitialRooms() async {
    final repo = ref.read(chatRepositoryProvider);
    try {
      final rooms = await repo.fetchLatestMessagesByRoom(limit: _pageSize);
      return RoomListState(
        rooms: rooms,
        hasMore: rooms.length >= _pageSize,
        lastTimestamp: rooms.isEmpty ? null : rooms.last.createdAt,
        status: const NetIdle(),
      );
    } catch (e, st) {
      return RoomListState(status: NetError(e, st));
    }
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null ||
        current.status is NetLoading ||
        !current.hasMore ||
        current.lastTimestamp == null) {
      return;
    }

    state = AsyncData(current.copyWith(status: const NetLoading()));

    try {
      final repo = ref.read(chatRepositoryProvider);
      final moreRooms = await repo.fetchLatestMessagesByRoom(
        limit: _pageSize,
        before: current.lastTimestamp,
      );

      final newState = current.copyWith(
        rooms: [...current.rooms, ...moreRooms],
        lastTimestamp: moreRooms.isEmpty
            ? current.lastTimestamp
            : moreRooms.last.createdAt,
        hasMore: moreRooms.length >= _pageSize,
        status: const NetIdle(),
      );

      state = AsyncData(newState);
    } catch (e, st) {
      state = AsyncData(current.copyWith(status: NetError(e, st)));
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    final nextState = await _loadInitialRooms();
    state = AsyncData(nextState);
  }
}

final chatRoomListControllerProvider =
    AutoDisposeAsyncNotifierProvider<ChatRoomListController, RoomListState>(
  ChatRoomListController.new,
);
