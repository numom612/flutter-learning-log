import 'dart:io';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/providers/profile_repository_provider.dart';
import '../../models/user_dto.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameCtl = useTextEditingController();
    final image = useState<File?>(null);
    final future = useMemoized(() => ref.read(profileRepositoryProvider).fetchProfile());
    final snap = useFuture(future);

    Future<void> pickImage() async {
      final px = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (px != null) image.value = File(px.path);
    }

    Future<void> save(UserModel user) async {
      final updated = user.copyWith(
        userName: nameCtl.text,
        iconUrl: image.value?.path,
      );
      await ref.read(profileRepositoryProvider).updateProfile(updated);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated')),
      );
    }

    if (!snap.hasData) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final user = snap.data!;
    nameCtl.text = user.userName;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.go('/signin'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: image.value != null
                    ? FileImage(image.value!)
                    : (user.iconUrl != null
                        ? NetworkImage(user.iconUrl!)
                        : null) as ImageProvider?,
                child: user.iconUrl == null && image.value == null
                    ? const Icon(Icons.person)
                    : null,
              ),
            ),
            TextField(
              controller: nameCtl,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => save(user),
              child: const Text('Save'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/chat/general'),
              child: const Text('Go to Chat Room'),
            ),
          ],
        ),
      ),
    );
  }
}