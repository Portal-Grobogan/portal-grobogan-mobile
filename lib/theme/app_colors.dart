import 'package:flutter/material.dart';

class AppColors {
  // Primary - Electric Blue System
  static const Color electricBlue = Color(0xFF0066FF);
  static const Color electricBlueDark = Color(0xFF0052CC);
  static const Color electricBlueLight = Color(0xFF3385FF);
  
  // Gradients
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0066FF), Color(0xFF00A3FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const Gradient heroGradient = LinearGradient(
    colors: [Color(0x00000000), Color(0x99000000)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  // Inverted Sections
  static const Color charcoal = Color(0xFF1A1D29);
  static const Color charcoalLight = Color(0xFF2D3142);
  
  // Neutrals
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF8F9FA);
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray900 = Color(0xFF111827);
  
  // Semantic
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  
  // Accent
  static const Color accentGold = Color(0xFFFFB800);
}
