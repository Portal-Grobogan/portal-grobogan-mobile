import 'package:flutter/material.dart';

import 'placeholder_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Berita',
      description: 'Informasi berita dan pengumuman terbaru dari pemerintah.',
      icon: Icons.newspaper_outlined,
    );
  }
}
