import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/hero_slides_provider.dart';
import '../../providers/layanan_provider.dart';
import '../../providers/berita_provider.dart';
import '../../providers/bencana_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/hero_carousel.dart';
import '../../widgets/service_card.dart';
import '../../widgets/news_card.dart';
import '../../widgets/disaster_alert.dart';
import '../../widgets/skeleton_loader.dart';
import '../../widgets/empty_state.dart';

class BerandaScreen extends ConsumerWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heroSlides = ref.watch(heroSlidesProvider);
    final layanan = ref.watch(semuaLayananProvider);
    final berita = ref.watch(beritaTerbaruProvider);
    final bencana = ref.watch(bencanaStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Portal Grobogan', style: AppTextStyles.headingLarge.copyWith(color: AppColors.white)),
            Text('Pusat Informasi & Layanan', style: AppTextStyles.bodySmall.copyWith(color: AppColors.white.withOpacity(0.8))),
          ],
        ),
        backgroundColor: AppColors.electricBlue,
        iconTheme: const IconThemeData(color: AppColors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(heroSlidesProvider);
          ref.invalidate(semuaLayananProvider);
          ref.invalidate(beritaTerbaruProvider);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              heroSlides.when(
                data: (slides) => HeroCarousel(slides: slides),
                loading: () => SkeletonLoader.card(),
                error: (e, _) => const SizedBox(height: 200, child: Center(child: Text('Gagal memuat banner'))),
              ),

              const SizedBox(height: AppDimensions.spacing24),

              // Bencana Alerts (Realtime)
              bencana.when(
                data: (alerts) {
                  if (alerts.isEmpty) return const SizedBox.shrink();
                  return Padding(
                    padding: AppDimensions.screenPadding.copyWith(top: 0, bottom: AppDimensions.spacing24),
                    child: Column(
                      children: alerts.map((a) => Padding(
                        padding: const EdgeInsets.only(bottom: AppDimensions.spacing8),
                        child: DisasterAlert(bencana: a),
                      )).toList(),
                    ),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (e, _) => const SizedBox.shrink(),
              ),

              // Layanan Section
              Padding(
                padding: AppDimensions.screenPadding.copyWith(top: 0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Layanan Publik', style: AppTextStyles.headingLarge),
                    TextButton(
                      onPressed: () => context.go('/layanan'),
                      child: Text('Lihat Semua', style: AppTextStyles.labelMedium.copyWith(color: AppColors.electricBlue)),
                    ),
                  ],
                ),
              ),
              layanan.when(
                data: (list) {
                  final displayList = list.take(4).toList();
                  return Padding(
                    padding: AppDimensions.screenPadding.copyWith(top: AppDimensions.spacing12),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppDimensions.spacing12,
                        mainAxisSpacing: AppDimensions.spacing12,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: displayList.length,
                      itemBuilder: (context, index) {
                        return ServiceCard(
                          layanan: displayList[index],
                          onTap: () {
                            if ((displayList[index].kategori ?? '').toLowerCase() == 'pariwisata') {
                              context.go('/layanan/pariwisata');
                            } else if ((displayList[index].kategori ?? '').toLowerCase() == 'kebencanaan') {
                              context.go('/layanan/kebencanaan');
                            } else {
                              // Redirect ke URL eksternal bisa dilakukan di sini
                            }
                          },
                        );
                      },
                    ),
                  );
                },
                loading: () => const Padding(
                  padding: AppDimensions.screenPadding,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, _) => const EmptyState(
                  icon: Icons.error,
                  title: 'Gagal',
                  description: 'Gagal memuat layanan',
                ),
              ),

              const SizedBox(height: AppDimensions.spacing12),

              // Berita Section
              Padding(
                padding: AppDimensions.screenPadding.copyWith(top: 0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Berita Terkini', style: AppTextStyles.headingLarge),
                    TextButton(
                      onPressed: () => context.go('/berita'),
                      child: Text('Lainnya', style: AppTextStyles.labelMedium.copyWith(color: AppColors.electricBlue)),
                    ),
                  ],
                ),
              ),
              berita.when(
                data: (list) {
                  if (list.isEmpty) {
                    return const Padding(
                      padding: AppDimensions.screenPadding,
                      child: Center(child: Text('Belum ada berita')),
                    );
                  }
                  return SizedBox(
                    height: 300,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing20),
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      separatorBuilder: (context, index) => const SizedBox(width: AppDimensions.spacing16),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 260,
                          child: NewsCard(
                            berita: list[index],
                            onTap: () => context.go('/berita/${list[index].slug}'),
                          ),
                        );
                      },
                    ),
                  );  
                },
                loading: () => const Padding(
                  padding: AppDimensions.screenPadding,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, _) => const EmptyState(
                  icon: Icons.error,
                  title: 'Gagal',
                  description: 'Gagal memuat berita',
                ),
              ),

              const SizedBox(height: AppDimensions.spacing48),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/layanan/pengaduan'),
        label: const Text('Buat Pengaduan'),
        icon: const Icon(Icons.add_comment),
        backgroundColor: AppColors.electricBlue,
        foregroundColor: AppColors.white,
      ),
    );
  }
}
