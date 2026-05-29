import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../providers/pariwisata_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/app_card.dart';
import '../../widgets/empty_state.dart';

class PariwisataScreen extends ConsumerWidget {
  const PariwisataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pariwisataState = ref.watch(semuaDestinasiProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: AppColors.electricBlue,
            iconTheme: const IconThemeData(color: AppColors.white),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Pariwisata Grobogan', style: AppTextStyles.headingLarge.copyWith(color: AppColors.white)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                ),
                child: Center(
                  child: Icon(Icons.landscape, size: 80, color: AppColors.white.withOpacity(0.3)),
                ),
              ),
            ),
          ),
          
          SliverPadding(
            padding: AppDimensions.screenPadding,
            sliver: pariwisataState.when(
              data: (destinasi) {
                if (destinasi.isEmpty) {
                  return const SliverFillRemaining(
                    child: EmptyState(
                      icon: Icons.map,
                      title: 'Belum ada data',
                      description: 'Data destinasi pariwisata belum tersedia.',
                    ),
                  );
                }
                
                return SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: AppDimensions.spacing16,
                    crossAxisSpacing: AppDimensions.spacing16,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = destinasi[index];
                      return AppCard(
                        padding: EdgeInsets.zero,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(AppDimensions.radiusMedium)),
                                child: item.fotoUrls.isNotEmpty
                                    ? CachedNetworkImage(
                                        imageUrl: item.fotoUrls.first,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Container(
                                          color: AppColors.gray200,
                                          child: const Center(child: CircularProgressIndicator()),
                                        ),
                                        errorWidget: (context, url, error) => Container(
                                          color: AppColors.gray200,
                                          child: const Icon(Icons.image, color: AppColors.gray500),
                                        ),
                                      )
                                    : Container(
                                        color: AppColors.gray200,
                                        width: double.infinity,
                                        child: const Icon(Icons.image, color: AppColors.gray500),
                                      ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(AppDimensions.spacing12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.nama,
                                      style: AppTextStyles.labelMedium,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on, size: 12, color: AppColors.gray500),
                                        const SizedBox(width: 4),
                                        Expanded(
                                          child: Text(
                                            item.alamat ?? 'Grobogan',
                                            style: AppTextStyles.bodySmall,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: destinasi.length,
                  ),
                );
              },
              loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
              error: (e, _) => SliverFillRemaining(
                child: EmptyState(
                  icon: Icons.error,
                  title: 'Gagal',
                  description: e.toString(),
                  onRetry: () => ref.invalidate(semuaDestinasiProvider),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
