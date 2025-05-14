import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _client;
  AuthRepository(this._client);

  /// メール & パスワードで新規登録
  Future<void> signUp(String email, String password) async {
    // 失敗時は AuthException が throw される
    await _client.auth.signUp(email: email, password: password);
  }

  /// メール & パスワードでログイン
  Future<void> signIn(String email, String password) async {
    await _client.auth.signInWithPassword(email: email, password: password);
  }

  /// ログアウト
  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}