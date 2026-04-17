import 'package:flutter/material.dart';

import 'placeholder_screen.dart';

class ComplaintsScreen extends StatelessWidget {
  const ComplaintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Pengaduan',
      description: 'Buat dan cek status pengaduan masyarakat.',
      icon: Icons.forum_outlined,
    );
  }
}
