import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class ComplaintStatusScreen extends StatelessWidget {
  const ComplaintStatusScreen({
    super.key,
    required this.trackingId,
  });

  final String trackingId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Status Pengaduan')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Deep link status pengaduan: $trackingId',
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
