import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../models/berita.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_dimensions.dart';
import 'app_card.dart';
import 'app_badge.dart';
import 'skeleton_loader.dart';

class NewsCard extends StatelessWidget {
  final Berita berita;
  final VoidCallback? onTap;
  
  const NewsCard({super.key, required this.berita, this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppDimensions.radiusMedium),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: berita.thumbnailUrl ?? '',
                fit: BoxFit.cover,
                placeholder: (context, url) => SkeletonLoader.card(),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.gray100,
                  child: const Icon(Icons.broken_image, color: AppColors.gray500),
                ),
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBadge.berita(),
                const SizedBox(height: 8),
                Text(
                  berita.judul,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: AppColors.gray500),
                    const SizedBox(width: 4),
                    Text(
                      _formatDate(berita.createdAt ?? DateTime.now()),
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy', 'id_ID').format(date);
  }
}
