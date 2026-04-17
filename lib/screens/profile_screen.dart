import 'package:flutter/material.dart';

import 'placeholder_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderScreen(
      title: 'Profil',
      description: 'Informasi profil dan identitas instansi Pemerintah Grobogan.',
      icon: Icons.person_outline_rounded,
    );
  }
}
