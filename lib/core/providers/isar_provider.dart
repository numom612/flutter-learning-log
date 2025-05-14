import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../services/isar_initializer.dart';
import '../../services/isar_service.dart';

/// Isar 初期化・保持用 AsyncNotifierProvider
final isarInitializerProvider =
    AsyncNotifierProvider<IsarInitializer, Isar>(() => IsarInitializer());

/// IsarService を注入する通常 Provider（Isar の準備完了後に使える）
final isarServiceProvider = Provider<IsarService>((ref) {
  final isar = ref.watch(isarInitializerProvider).value;
  if (isar == null) {
    throw Exception('Isar not initialized');
  }
  return IsarService(isar);
});