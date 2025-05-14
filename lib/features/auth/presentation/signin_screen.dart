import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/providers/auth_repository_provider.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailCtl = useTextEditingController();
    final passCtl = useTextEditingController();
    final loading = useState(false);

    Future<void> submit() async {
      loading.value = true;
      try {
        await ref.read(authRepositoryProvider).signIn(
              emailCtl.text,
              passCtl.text,
            );
        context.go('/profile');
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      } finally {
        loading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailCtl,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passCtl,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loading.value ? null : submit,
              child: loading.value
                  ? const CircularProgressIndicator()
                  : const Text('Sign In'),
            ),
            TextButton(
              onPressed: () => context.go('/signup'),
              child: const Text('Create account'),
            ),
          ],
        ),
      ),
    );
  }
}