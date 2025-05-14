import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/signin_screen.dart';
import '../../features/auth/presentation/signup_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/chat/presentation/chat_room_screen.dart';
import '../../features/chat/presentation/room_list_screen.dart'; // ★ 追加！！

final GoRouter appRouter = GoRouter(
  initialLocation: '/signin', // 最初はログイン画面
  routes: [
    GoRoute(
      path: '/signin',
      builder: (_, __) => const SignInScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (_, __) => const SignUpScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (_, __) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/rooms',
      builder: (_, __) => const RoomListScreen(), // ★ Roomリスト画面
    ),
    GoRoute(
      path: '/chat/:roomId',
      builder: (context, state) {
        final roomId = state.pathParameters['roomId']!;
        return ChatRoomScreen(roomId: roomId);
      },
    ),
  ],
);