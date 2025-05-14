import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/net_status.dart';

/// チャットルームごとのネットワーク状態を保持するProvider
final chatRoomNetStatusProvider =
    StateProvider.family<NetStatus, String>((ref, roomId) {
  return const NetIdle(); // 初期状態はアイドル
});