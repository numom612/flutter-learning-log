import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../core/providers/connectivity_provider.dart';
import '../../models/message_model.dart';
import '../../models/message_dto.dart';
import '../providers/chat_room_controller.dart';
// ─────────────────────────────────────────────────────────────────────────────
// UI – ChatRoomScreen
// ─────────────────────────────────────────────────────────────────────────────

class ChatRoomScreen extends HookConsumerWidget {
  const ChatRoomScreen({Key? key, required this.roomId}) : super(key: key);
  final String roomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final scrollController = useScrollController();
    final connectivity = ref.watch(connectivityProvider);
    final controller = ref.read(chatRoomControllerProvider(roomId).notifier);
    final chatState = ref.watch(chatRoomControllerProvider(roomId));
    final state = chatState.requireValue;

    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 100) {
          controller.fetchMore(); // 呼び出し側は状態を気にしなくてよい
        }
      }
      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    final isLoading = state.isLoading;
    final hasError = state.hasError;

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat: $roomId'),
        bottom: isLoading
            ? const PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: LinearProgressIndicator(),
              )
            : null,
      ),
      body: Column(
        children: [
          if (hasError)
            Container(
              color: Colors.red[100],
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                children: const [
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'エラーが発生しました。接続を確認してください。',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: chatState.when(
              data: (state) {
                if (state.messages.isEmpty) {
                  return const Center(child: Text('メッセージはありません'));
                }
                return ListView.builder(
                  controller: scrollController,
                  reverse: true,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: state.messages.length,
                  itemBuilder: (_, i) => _MessageTile(msg: state.messages[i]),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) {
                if (state?.messages.isNotEmpty == true) {
                  return ListView.builder(
                    controller: scrollController,
                    reverse: true,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: state!.messages.length,
                    itemBuilder: (_, i) => _MessageTile(msg: state.messages[i]),
                  );
                }
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red),
                      const SizedBox(height: 16),
                      const Text('読み込みに失敗しました'),
                      TextButton(
                        onPressed: () =>
                            ref.refresh(chatRoomControllerProvider(roomId)),
                        child: const Text('再読み込み'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          const Divider(height: 1),
          _InputBar(
            controller: textController,
            connectivity: connectivity,
            isLoading: isLoading,
            onSend: () async {
              final text = textController.text.trim();
              if (text.isEmpty) return;

              final dto = MessageDto(
                id: const Uuid().v4(),
                roomId: roomId,
                senderId: Supabase.instance.client.auth.currentUser!.id,
                content: text,
                createdAt: DateTime.now(),
              );

              textController.clear();
              await controller.sendMessage(dto);

              if (scrollController.hasClients) {
                scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({Key? key, required this.msg}) : super(key: key);
  final MessageModel msg;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(msg.content),
      subtitle: Text(msg.senderId),
      trailing: Text(_fmt(msg.createdAt), style: const TextStyle(fontSize: 10)),
    );
  }

  static String _fmt(DateTime dt) {
    final l = dt.toLocal();
    return '${l.hour.toString().padLeft(2, '0')}:${l.minute.toString().padLeft(2, '0')}';
  }
}

class _InputBar extends StatelessWidget {
  const _InputBar({
    Key? key,
    required this.controller,
    required this.connectivity,
    required this.isLoading,
    required this.onSend,
  }) : super(key: key);

  final TextEditingController controller;
  final AsyncValue<ConnectivityResult> connectivity;
  final bool isLoading;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    final isOffline = connectivity.asData?.value == ConnectivityResult.none;
    final hint = isOffline ? 'Offline: message queued' : 'Type a message';

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  enabled: !isLoading,
                ),
                textInputAction: TextInputAction.send,
                onSubmitted: (_) => onSend(),
              ),
            ),
            IconButton(
              icon: isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.send),
              onPressed:
                  isLoading || controller.text.trim().isEmpty ? null : onSend,
            ),
          ],
        ),
      ),
    );
  }
}
