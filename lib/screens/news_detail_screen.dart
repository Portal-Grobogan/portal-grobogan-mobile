import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({
    super.key,
    required this.slug,
  });

  final String slug;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Berita')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Deep link berita aktif untuk slug: $slug',
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
