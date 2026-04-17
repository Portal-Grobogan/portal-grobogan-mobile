import 'package:go_router/go_router.dart';

import '../screens/complaint_status_screen.dart';
import '../screens/complaints_screen.dart';
import '../screens/home_screen.dart';
import '../screens/news_detail_screen.dart';
import '../screens/news_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/services_screen.dart';
import '../widgets/scaffold_with_bottom_nav_bar.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/beranda',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithBottomNavBar(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/beranda',
                name: 'beranda',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/layanan',
                name: 'layanan',
                builder: (context, state) => const ServicesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/pengaduan',
                name: 'pengaduan',
                builder: (context, state) => const ComplaintsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/berita',
                name: 'berita',
                builder: (context, state) => const NewsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profil',
                name: 'profil',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/berita/:slug',
        name: 'detail-berita',
        builder: (context, state) {
          final slug = state.pathParameters['slug'] ?? '';
          return NewsDetailScreen(slug: slug);
        },
      ),
      GoRoute(
        path: '/pengaduan/status/:trackingId',
        name: 'status-pengaduan',
        builder: (context, state) {
          final trackingId = state.pathParameters['trackingId'] ?? '';
          return ComplaintStatusScreen(trackingId: trackingId);
        },
      ),
    ],
  );
}
