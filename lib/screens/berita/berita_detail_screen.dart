import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../providers/berita_provider.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/app_badge.dart';
import '../../widgets/empty_state.dart';

class BeritaDetailScreen extends ConsumerWidget {
  final String slug;
  
  const BeritaDetailScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final beritaState = ref.watch(beritaBySlugProvider(slug));
    
    return beritaState.when(
      data: (berita) {
        if (berita == null) {
          return const Scaffold(
            body: EmptyState(
              icon: Icons.error_outline,
              title: 'Berita tidak ditemukan',
              description: 'Berita yang Anda cari tidak tersedia atau telah dihapus.',
            ),
          );
        }

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250,
                pinned: true,
                backgroundColor: AppColors.electricBlue,
                iconTheme: const IconThemeData(color: AppColors.white),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: berita.thumbnailUrl ?? '',
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Container(color: AppColors.gray200),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: AppColors.heroGradient,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SliverToBoxAdapter(
                child: Transform.translate(
                  offset: const Offset(0, -20),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBadge(
                          label: berita.kategori ?? 'Umum',
                          color: (berita.kategori?.toLowerCase() ?? 'umum') == 'pengumuman' ? AppColors.accentGold : AppColors.electricBlue,
                        ),
                        const SizedBox(height: 12),
                        Text(berita.judul, style: AppTextStyles.displayMedium),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 14, color: AppColors.gray500),
                            const SizedBox(width: 4),
                            Text(
                              DateFormat('dd MMM yyyy', 'id_ID').format(berita.createdAt ?? DateTime.now()),
                              style: AppTextStyles.bodySmall,
                            ),
                          ],
                        ),
                        const Divider(height: 32),
                        Html(
                          data: berita.konten,
                          style: {
                            "body": Style(
                              margin: Margins.zero,
                              padding: HtmlPaddings.zero,
                              fontSize: FontSize(16.0),
                              color: AppColors.gray900,
                              lineHeight: LineHeight.number(1.6),
                            ),
                          },
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              Share.share('Baca berita menarik ini: ${berita.judul} - https://portalgrobogan.id/berita/$slug');
                            },
                            icon: const Icon(Icons.share, color: AppColors.electricBlue),
                            label: Text('Bagikan', style: AppTextStyles.buttonText.copyWith(color: AppColors.electricBlue)),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AppColors.electricBlue),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(
        body: EmptyState(
          icon: Icons.error_outline,
          title: 'Error',
          description: e.toString(),
        ),
      ),
    );
  }
}
