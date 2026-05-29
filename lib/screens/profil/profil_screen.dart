import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/app_card.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Instansi', style: AppTextStyles.headingLarge),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.charcoal,
      ),
      body: ListView(
        padding: AppDimensions.screenPadding,
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.gray100,
                  ),
                  child: const Icon(Icons.account_balance, size: 50, color: AppColors.electricBlue),
                ),
                const SizedBox(height: 16),
                Text('Pemerintah Kabupaten Grobogan', style: AppTextStyles.headingLarge),
                const SizedBox(height: 4),
                Text('portal.grobogan.go.id', style: AppTextStyles.bodyMedium.copyWith(color: AppColors.electricBlue)),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spacing32),
          
          Text('Tentang Kami', style: AppTextStyles.labelMedium.copyWith(color: AppColors.gray500)),
          const SizedBox(height: 8),
          AppCard(
            child: Column(
              children: [
                _buildListTile(Icons.info_outline, 'Visi & Misi'),
                const Divider(height: 1),
                _buildListTile(Icons.history, 'Sejarah Singkat'),
                const Divider(height: 1),
                _buildListTile(Icons.people_outline, 'Struktur Organisasi'),
              ],
            ),
          ),
          
          const SizedBox(height: AppDimensions.spacing24),
          
          Text('Kontak & Bantuan', style: AppTextStyles.labelMedium.copyWith(color: AppColors.gray500)),
          const SizedBox(height: 8),
          AppCard(
            child: Column(
              children: [
                _buildListTile(Icons.phone, 'Hubungi Kami'),
                const Divider(height: 1),
                _buildListTile(Icons.help_outline, 'FAQ'),
                const Divider(height: 1),
                _buildListTile(Icons.shield_outlined, 'Kebijakan Privasi'),
              ],
            ),
          ),
          
          const SizedBox(height: AppDimensions.spacing48),
          Center(
            child: Text(
              'Versi 1.0.0\n© 2026 Pemkab Grobogan',
              style: AppTextStyles.bodySmall.copyWith(color: AppColors.gray500),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.gray500),
      title: Text(title, style: AppTextStyles.bodyMedium),
      trailing: const Icon(Icons.chevron_right, color: AppColors.gray500),
      onTap: () {},
    );
  }
}
