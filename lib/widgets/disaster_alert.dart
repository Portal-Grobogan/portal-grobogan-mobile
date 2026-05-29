import 'dart:async';
import 'package:flutter/material.dart';
import '../models/bencana.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_dimensions.dart';

class DisasterAlert extends StatefulWidget {
  final Bencana bencana;

  const DisasterAlert({super.key, required this.bencana});

  @override
  State<DisasterAlert> createState() => _DisasterAlertState();
}

class _DisasterAlertState extends State<DisasterAlert> {
  bool _isPulsing = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.bencana.tingkatBahaya?.toUpperCase() == 'BAHAYA') {
      _timer = Timer.periodic(const Duration(milliseconds: 600), (timer) {
        if (mounted) {
          setState(() => _isPulsing = !_isPulsing);
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData iconData;
    
    switch (widget.bencana.tingkatBahaya?.toUpperCase()) {
      case 'BAHAYA':
        statusColor = AppColors.danger;
        iconData = Icons.warning;
        break;
      case 'WASPADA':
        statusColor = AppColors.warning;
        iconData = Icons.warning_amber;
        break;
      case 'AMAN':
      default:
        statusColor = AppColors.success;
        iconData = Icons.check_circle;
    }

    return AnimatedOpacity(
      opacity: _isPulsing ? 0.6 : 1.0,
      duration: const Duration(milliseconds: 600),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: statusColor.withOpacity(0.05),
          borderRadius: const BorderRadius.horizontal(
            right: Radius.circular(AppDimensions.radiusMedium),
          ),
          border: Border(
            left: BorderSide(color: statusColor, width: 4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(iconData, color: statusColor, size: 20),
                const SizedBox(width: 8),
                Text(
                  widget.bencana.tingkatBahaya ?? 'INFO',
                  style: AppTextStyles.labelMedium.copyWith(color: statusColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              widget.bencana.judul ?? '',
              style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
            ),
            if (widget.bencana.deskripsi != null) ...[
              const SizedBox(height: 4),
              Text(
                widget.bencana.deskripsi!,
                style: AppTextStyles.bodyMedium,
              ),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: AppColors.gray500),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    widget.bencana.lokasi ?? '',
                    style: AppTextStyles.bodySmall,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
