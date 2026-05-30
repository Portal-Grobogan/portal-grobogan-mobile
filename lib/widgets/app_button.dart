import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_dimensions.dart';

enum AppButtonVariant { primary, secondary, ghost, danger }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.icon,
  });
  
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: onPressed != null ? 1.0 : 0.98,
      duration: const Duration(milliseconds: 150),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: onPressed == null && !isLoading
            ? AppColors.gray200
            : _getBackgroundColor(),
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          boxShadow: variant == AppButtonVariant.primary && onPressed != null
            ? AppDimensions.shadowBlue 
            : null,
          border: variant == AppButtonVariant.secondary
            ? Border.all(color: onPressed == null ? AppColors.gray200 : AppColors.electricBlue, width: 2)
            : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            child: Center(
              child: isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(_getTextColor()),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (icon != null) ...[
                        Icon(icon, color: _getTextColor(), size: 20),
                        const SizedBox(width: 8),
                      ],
                      Text(label, style: _getTextStyle()),
                    ],
                  ),
            ),
          ),
        ),
      ),
    );
  }
  
  Color _getBackgroundColor() {
    switch (variant) {
      case AppButtonVariant.secondary:
        return AppColors.white;
      case AppButtonVariant.ghost:
        return Colors.transparent;
      case AppButtonVariant.danger:
        return AppColors.danger;
      case AppButtonVariant.primary:
        return AppColors.electricBlue;
      default:
        return AppColors.electricBlue;
    }
  }
  
  Color _getTextColor() {
    if (onPressed == null && !isLoading) {
      return AppColors.gray500;
    }
    return variant == AppButtonVariant.secondary 
      ? AppColors.electricBlue 
      : AppColors.white;
  }
  
  TextStyle _getTextStyle() {
    return AppTextStyles.buttonText.copyWith(color: _getTextColor());
  }
}
