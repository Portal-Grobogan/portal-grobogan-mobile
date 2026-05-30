import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/layanan.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class LayananDetailSheet {
  static void show(BuildContext context, Layanan layanan) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                layanan.nama,
                style: AppTextStyles.headingLarge,
              ),
              const SizedBox(height: 8),
              if (layanan.kategori != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.electricBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    layanan.kategori!.toUpperCase(),
                    style: AppTextStyles.labelMedium.copyWith(
                      color: AppColors.electricBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              Text(
                layanan.deskripsi ?? 'Detail informasi belum tersedia.',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 24),
              if (layanan.urlPath != null && layanan.urlPath!.isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.electricBlue,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () async {
                      final url = Uri.parse(layanan.urlPath!);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url, mode: LaunchMode.externalApplication);
                      }
                    },
                    child: const Text('Kunjungi Web Layanan'),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
