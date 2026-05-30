import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../widgets/scaffold_with_bottom_nav.dart';
import '../screens/beranda/beranda_screen.dart';
import '../screens/layanan/layanan_screen.dart';
import '../screens/layanan/kebencanaan_screen.dart';
import '../screens/berita/berita_screen.dart';
import '../screens/berita/berita_detail_screen.dart';
import '../screens/pengaduan/pengaduan_screen.dart';
import '../screens/pengaduan/pengaduan_sukses_screen.dart';
import '../screens/pengaduan/pengaduan_cek_screen.dart';
import '../screens/pariwisata/pariwisata_screen.dart';
import '../screens/profil/profil_screen.dart';
import '../screens/profil/profil_detail_screen.dart';
import '../screens/notifikasi/notifikasi_screen.dart';

part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithBottomNav(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const BerandaScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/layanan',
                builder: (context, state) => const LayananScreen(),
                routes: [
                  GoRoute(
                    path: 'kebencanaan',
                    builder: (context, state) => const KebencanaanScreen(),
                  ),
                  GoRoute(
                    path: 'pariwisata',
                    builder: (context, state) => const PariwisataScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/pengaduan',
                builder: (context, state) => const PengaduanScreen(),
                routes: [
                  GoRoute(
                    path: 'sukses/:id',
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return PengaduanSuksesScreen(id: id);
                    },
                  ),
                  GoRoute(
                    path: 'cek',
                    builder: (context, state) => const PengaduanCekScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/berita',
                builder: (context, state) => const BeritaScreen(),
                routes: [
                  GoRoute(
                    path: ':slug',
                    builder: (context, state) {
                      final slug = state.pathParameters['slug']!;
                      return BeritaDetailScreen(slug: slug);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profil',
                builder: (context, state) => const ProfilScreen(),
                routes: [
                  GoRoute(
                    path: 'detail/:title',
                    builder: (context, state) {
                      final title = state.pathParameters['title']!;
                      return ProfilDetailScreen(title: Uri.decodeComponent(title));
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/notifikasi',
        builder: (context, state) => const NotifikasiScreen(),
      ),
    ],
  );
}
