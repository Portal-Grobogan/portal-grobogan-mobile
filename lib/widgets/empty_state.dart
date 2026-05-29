import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_dimensions.dart';
import 'app_button.dart';

class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onRetry;
  
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onRetry,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: AppColors.gray500),
            const SizedBox(height: 16),
            Text(title, style: AppTextStyles.headingLarge),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.gray500,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              AppButton(
                label: 'Muat Ulang',
                variant: AppButtonVariant.secondary,
                onPressed: onRetry,
                icon: Icons.refresh,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
