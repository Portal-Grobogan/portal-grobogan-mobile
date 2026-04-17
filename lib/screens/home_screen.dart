import 'package:flutter/material.dart';

import 'placeholder_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Beranda',
      description: 'Ringkasan portal, hero carousel, dan layanan unggulan.',
      icon: Icons.home_outlined,
    );
  }
}
