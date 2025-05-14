import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/user_dto.dart';

class ProfileRepository {
  final SupabaseClient _client;
  ProfileRepository(this._client);

  Future<UserModel> fetchProfile() async {
    final user = _client.auth.currentUser;
    if (user == null) throw Exception('Not logged in');
    final data = await _client.from('profiles').select().eq('id', user.id).single();
    return UserModel.fromJson(data);
  }

  Future<void> updateProfile(UserModel model) async {
    await _client.from('profiles').upsert(model.toJson());
  }
}
