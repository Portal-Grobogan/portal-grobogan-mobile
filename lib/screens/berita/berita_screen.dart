import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/berita_provider.dart';
import '../../providers/pengumuman_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/news_card.dart';
import '../../widgets/empty_state.dart';

class BeritaScreen extends ConsumerWidget {
  const BeritaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Berita & Pengumuman', style: AppTextStyles.headingLarge),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.charcoal,
          bottom: const TabBar(
            labelColor: AppColors.electricBlue,
            unselectedLabelColor: AppColors.gray500,
            indicatorColor: AppColors.electricBlue,
            tabs: [
              Tab(text: 'Berita'),
              Tab(text: 'Pengumuman'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _BeritaTab(),
            _PengumumanTab(),
          ],
        ),
      ),
    );
  }
}

class _BeritaTab extends ConsumerWidget {
  const _BeritaTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beritaState = ref.watch(beritaTerbaruProvider);

    return beritaState.when(
      data: (semuaBerita) {
        if (semuaBerita.isEmpty) {
          return const EmptyState(
            icon: Icons.article_outlined,
            title: 'Belum ada Berita',
            description: 'Konten untuk kategori ini belum tersedia saat ini.',
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(beritaTerbaruProvider);
          },
          child: ListView.separated(
            padding: AppDimensions.screenPadding,
            itemCount: semuaBerita.length,
            separatorBuilder: (context, index) => const SizedBox(height: AppDimensions.spacing16),
            itemBuilder: (context, index) {
              return NewsCard(
                berita: semuaBerita[index],
                onTap: () => context.go('/berita/${semuaBerita[index].slug}'),
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => EmptyState(
        icon: Icons.error_outline,
        title: 'Gagal memuat',
        description: 'Terjadi kesalahan: $e',
        onRetry: () => ref.invalidate(beritaTerbaruProvider),
      ),
    );
  }
}

class _PengumumanTab extends ConsumerWidget {
  const _PengumumanTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pengumumanState = ref.watch(pengumumanTerbaruProvider);

    return pengumumanState.when(
      data: (semuaPengumuman) {
        if (semuaPengumuman.isEmpty) {
          return const EmptyState(
            icon: Icons.announcement_outlined,
            title: 'Belum ada Pengumuman',
            description: 'Konten untuk kategori ini belum tersedia saat ini.',
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(pengumumanTerbaruProvider);
          },
          child: ListView.separated(
            padding: AppDimensions.screenPadding,
            itemCount: semuaPengumuman.length,
            separatorBuilder: (context, index) => const SizedBox(height: AppDimensions.spacing16),
            itemBuilder: (context, index) {
              final item = semuaPengumuman[index];
              return ListTile(
                leading: const Icon(Icons.campaign, color: AppColors.electricBlue),
                title: Text(item.judul, style: AppTextStyles.labelMedium),
                subtitle: Text('Tap untuk mengunduh lampiran (jika ada)', style: AppTextStyles.bodySmall),
                onTap: () {
                  // In real app, open file_url or show modal
                },
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => EmptyState(
        icon: Icons.error_outline,
        title: 'Gagal memuat',
        description: 'Terjadi kesalahan: $e',
        onRetry: () => ref.invalidate(pengumumanTerbaruProvider),
      ),
    );
  }
}
