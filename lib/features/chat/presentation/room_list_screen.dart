// lib/features/room/presentation/room_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/chat_room_list_controller.dart';

class RoomListScreen extends HookConsumerWidget {
  const RoomListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final roomListState = ref.watch(chatRoomListControllerProvider);
    final controller = ref.read(chatRoomListControllerProvider.notifier);

    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 100) {
          controller.loadMore();
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('チャットルーム一覧'),
        bottom: roomListState.maybeWhen(
          data: (state) => state.isLoading
              ? const PreferredSize(
                  preferredSize: Size.fromHeight(2),
                  child: LinearProgressIndicator(),
                )
              : null,
          orElse: () => null,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refresh(),
        child: Builder(
          builder: (_) {
            return roomListState.when(
              data: (state) {
                if (state.rooms.isEmpty) {
                  return const Center(child: Text('ルームがありません'));
                }

                return ListView.builder(
                  controller: scrollController,
                  itemCount: state.rooms.length + (state.isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == state.rooms.length) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    final message = state.rooms[index];
                    return ListTile(
                      title: Text('Room: ${message.roomId}'),
                      subtitle: Text(
                        message.content,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        _formatDate(message.createdAt),
                        style: const TextStyle(fontSize: 10),
                      ),
                      onTap: () => context.go('/chat/${message.roomId}'),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, stack) {
                final fallback = roomListState.valueOrNull;
                if (fallback != null && fallback.rooms.isNotEmpty) {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: fallback.rooms.length,
                    itemBuilder: (context, index) {
                      final message = fallback.rooms[index];
                      return ListTile(
                        title: Text('Room: ${message.roomId}'),
                        subtitle: Text(
                          message.content,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Text(
                          _formatDate(message.createdAt),
                          style: const TextStyle(fontSize: 10),
                        ),
                        onTap: () => context.go('/chat/${message.roomId}'),
                      );
                    },
                  );
                }

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('データの取得に失敗しました'),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () => controller.refresh(),
                        child: const Text('再読み込み'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
    String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (now.difference(date).inDays == 0) {
      return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
    } else {
      return '${date.month}/${date.day}';
    }
  }
}

