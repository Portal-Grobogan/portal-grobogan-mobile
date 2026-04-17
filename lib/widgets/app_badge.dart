import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

enum BadgeType { neutral, success, warning, error, primary }

class AppBadge extends StatelessWidget {
  final String text;
  final BadgeType type;

  const AppBadge({
    super.key,
    required this.text,
    this.type = BadgeType.neutral,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;

    switch (type) {
      case BadgeType.success:
        bgColor = const Color(0xFFD1FAE5);
        textColor = const Color(0xFF065F46);
        break;
      case BadgeType.warning:
        bgColor = const Color(0xFFFEF3C7);
        textColor = const Color(0xFF92400E);
        break;
      case BadgeType.error:
        bgColor = const Color(0xFFFEE2E2);
        textColor = const Color(0xFF991B1B);
        break;
      case BadgeType.primary:
        bgColor = const Color(0xFFE8F5EE); 
        textColor = const Color(0xFF134429); 
        break;
      case BadgeType.neutral:
        bgColor = Colors.grey.shade200;
        textColor = Colors.grey.shade800;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: AppTextStyles.caption.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 10,
        ),
      ),
    );
  }
}
