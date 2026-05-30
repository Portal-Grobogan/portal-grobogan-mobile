import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/bencana_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/disaster_alert.dart';
import '../../widgets/empty_state.dart';

class KebencanaanScreen extends ConsumerWidget {
  const KebencanaanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bencanaStream = ref.watch(bencanaStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pusat Kebencanaan', style: AppTextStyles.headingLarge),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.charcoal,
      ),
      body: Column(
        children: [
          Container(
            padding: AppDimensions.screenPadding,
            color: AppColors.white,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Peringatan Darurat', style: AppTextStyles.displayMedium),
                const SizedBox(height: 8),
                Text(
                  'Pantauan situasi darurat dan kebencanaan terkini di Kabupaten Grobogan. Tetap waspada dan ikuti arahan petugas.',
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray500),
                ),
              ],
            ),
          ),
          Expanded(
            child: bencanaStream.when(
              data: (alerts) {
                if (alerts.isEmpty) {
                  return const EmptyState(
                    icon: Icons.verified_user_outlined,
                    title: 'Aman Terkendali',
                    description: 'Tidak ada laporan peringatan darurat saat ini.',
                  );
                }

                return ListView.separated(
                  padding: AppDimensions.screenPadding,
                  itemCount: alerts.length,
                  separatorBuilder: (context, index) => const SizedBox(height: AppDimensions.spacing16),
                  itemBuilder: (context, index) {
                    return DisasterAlert(bencana: alerts[index]);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Gagal memuat data: $e', style: const TextStyle(color: AppColors.danger))),
            ),
          ),
        ],
      ),
    );
  }
}
