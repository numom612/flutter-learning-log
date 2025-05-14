import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/chat_repository.dart';
import '../../../core/providers/isar_provider.dart';
import '../../../core/providers/supabase_provider.dart';
import '../../../services/supabase_service.dart';

final supabaseServiceProvider = Provider(
  (ref) => SupabaseService(ref.watch(supabaseClientProvider)),
);

final chatRepositoryProvider = Provider<ChatRepository>((ref) {
  final isarService = ref.watch(isarServiceProvider);
  final supabase = ref.watch(supabaseServiceProvider);

return ChatRepository(isarService, supabase);
});