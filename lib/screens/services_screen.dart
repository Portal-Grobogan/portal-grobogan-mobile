import 'package:flutter/material.dart';

import 'placeholder_screen.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Layanan',
      description: 'Daftar layanan publik yang tersedia untuk warga.',
      icon: Icons.grid_view_rounded,
    );
  }
}
