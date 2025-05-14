import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/profile/data/profile_repository.dart';
import 'supabase_provider.dart';

final profileRepositoryProvider = Provider(
  (ref) => ProfileRepository(ref.watch(supabaseClientProvider)),
);
