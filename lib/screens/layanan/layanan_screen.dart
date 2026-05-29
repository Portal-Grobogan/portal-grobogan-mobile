import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/layanan_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/service_card.dart';
import '../../widgets/empty_state.dart';

class LayananScreen extends ConsumerStatefulWidget {
  const LayananScreen({super.key});

  @override
  ConsumerState<LayananScreen> createState() => _LayananScreenState();
}

class _LayananScreenState extends ConsumerState<LayananScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final layananState = ref.watch(semuaLayananProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Layanan Publik', style: AppTextStyles.headingLarge),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.charcoal,
      ),
      body: Column(
        children: [
          Padding(
            padding: AppDimensions.screenPadding,
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Cari layanan...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: layananState.when(
              data: (layanan) {
                final filtered = layanan.where((l) => l.nama.toLowerCase().contains(_searchQuery) || (l.kategori ?? '').toLowerCase().contains(_searchQuery)).toList();

                if (filtered.isEmpty) {
                  return const EmptyState(
                    icon: Icons.search_off,
                    title: 'Layanan tidak ditemukan',
                    description: 'Coba gunakan kata kunci lain',
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(semuaLayananProvider);
                  },
                  child: GridView.builder(
                    padding: AppDimensions.screenPadding,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppDimensions.spacing16,
                      mainAxisSpacing: AppDimensions.spacing16,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: filtered.length,
                    itemBuilder: (context, index) {
                      return ServiceCard(
                        layanan: filtered[index],
                        onTap: () {
                          if ((filtered[index].kategori ?? '').toLowerCase() == 'pariwisata') {
                            context.go('/layanan/pariwisata');
                          } else if ((filtered[index].kategori ?? '').toLowerCase() == 'kebencanaan') {
                            context.go('/layanan/kebencanaan');
                          } else if ((filtered[index].kategori ?? '').toLowerCase() == 'pengaduan') {
                            context.go('/layanan/pengaduan');
                          }
                        },
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => EmptyState(
                icon: Icons.error_outline,
                title: 'Error',
                description: e.toString(),
                onRetry: () => ref.invalidate(semuaLayananProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
