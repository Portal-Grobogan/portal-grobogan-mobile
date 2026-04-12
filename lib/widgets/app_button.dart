import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum AppButtonVariant { primary, accent, outline }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  final bool isFullWidth;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.icon,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    BorderSide borderSide;

    switch (variant) {
      case AppButtonVariant.primary:
        backgroundColor = AppColors.primary;
        textColor = Colors.white;
        borderSide = BorderSide.none;
        break;
      case AppButtonVariant.accent:
        backgroundColor = AppColors.accent;
        textColor = Colors.white;
        borderSide = BorderSide.none;
        break;
      case AppButtonVariant.outline:
        backgroundColor = Colors.transparent;
        textColor = AppColors.primary;
        borderSide = const BorderSide(color: AppColors.primary);
        break;
    }

    final buttonContent = isLoading
        ? SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: textColor,
            ),
          )
        : Row(
            mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          );

    final button = ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: borderSide,
        ),
        elevation: variant == AppButtonVariant.outline ? 0 : 2,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: buttonContent,
    );
    
    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}
