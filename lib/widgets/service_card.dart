import 'package:flutter/material.dart';
import '../models/layanan.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_text_styles.dart';
import 'app_card.dart';

class ServiceCard extends StatelessWidget {
  final Layanan layanan;
  final VoidCallback? onTap;

  const ServiceCard({
    super.key,
    required this.layanan,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch ((layanan.kategori ?? '').toLowerCase()) {
      case 'kesehatan': icon = Icons.medical_services; break;
      case 'pendidikan': icon = Icons.school; break;
      case 'pariwisata': icon = Icons.landscape; break;
      case 'kebencanaan': icon = Icons.warning; break;
      default: icon = Icons.account_balance;
    }

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.electricBlue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 32, color: AppColors.electricBlue),
          ),
          const SizedBox(height: AppDimensions.spacing12),
          Text(
            layanan.nama,
            style: AppTextStyles.labelMedium.copyWith(fontSize: 13),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
