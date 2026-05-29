import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

class AppBadge extends StatelessWidget {
  final String label;
  final Color color;
  
  const AppBadge({super.key, required this.label, required this.color});
  
  factory AppBadge.berita() => const AppBadge(
    label: 'Berita',
    color: AppColors.electricBlue,
  );
  
  factory AppBadge.pengumuman() => const AppBadge(
    label: 'Pengumuman',
    color: AppColors.accentGold,
  );
  
  factory AppBadge.status(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'diterima':
        color = AppColors.gray500;
        break;
      case 'proses':
        color = AppColors.info;
        break;
      case 'selesai':
        color = AppColors.success;
        break;
      default:
        color = AppColors.gray500;
    }
    return AppBadge(label: status, color: color);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
