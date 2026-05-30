import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/app_button.dart';

class PengaduanSuksesScreen extends StatelessWidget {
  final String id;
  const PengaduanSuksesScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: AppDimensions.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.success.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle, size: 80, color: AppColors.success),
              ),
              const SizedBox(height: AppDimensions.spacing24),
              Text('Pengaduan Terkirim!', style: AppTextStyles.displayMedium, textAlign: TextAlign.center),
              const SizedBox(height: AppDimensions.spacing12),
              Text(
                'Laporan Anda telah berhasil kami terima. Simpan ID Resi di bawah ini untuk mengecek status tindak lanjutnya.',
                style: AppTextStyles.bodyMedium.copyWith(color: AppColors.gray500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.spacing32),
              
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.gray50,
                  border: Border.all(color: AppColors.gray200, width: 2, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
                ),
                child: Column(
                  children: [
                    Text('ID Resi Pengaduan', style: AppTextStyles.labelMedium),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            id, 
                            style: AppTextStyles.headingLarge.copyWith(letterSpacing: 1.5, color: AppColors.electricBlue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.copy, color: AppColors.gray500),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: id));
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ID disalin!')));
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: AppDimensions.spacing48),
              
              AppButton(
                label: 'Kembali ke Beranda',
                onPressed: () => context.go('/'),
                icon: Icons.home,
              ),
              const SizedBox(height: AppDimensions.spacing16),
              AppButton(
                label: 'Cek Status Sekarang',
                variant: AppButtonVariant.secondary,
                onPressed: () => context.push('/pengaduan/cek'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
