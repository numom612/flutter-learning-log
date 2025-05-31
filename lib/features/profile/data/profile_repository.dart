import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/user_dto.dart';

class ProfileRepository {
  final SupabaseClient _client;
  ProfileRepository(this._client);

  Future<UserDto> fetchProfile() async {
    final user = _client.auth.currentUser;
    if (user == null) throw Exception('Not logged in');
    final data =
        await _client.from('profiles').select().eq('id', user.id).single();
    return UserDto.fromJson(data);
  }

  Future<void> updateProfile(UserDto dto) async {
    await _client.from('profiles').upsert(dto.toJson());
  }
}
