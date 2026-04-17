import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Display font: Montserrat
  static TextStyle get display => GoogleFonts.montserrat(
    color: AppColors.charcoal,
  );

  static TextStyle get displayBold => GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,
    color: AppColors.charcoal,
  );

  static TextStyle get h1 => displayBold.copyWith(fontSize: 32);
  static TextStyle get h2 => displayBold.copyWith(fontSize: 24);
  static TextStyle get h3 => displayBold.copyWith(fontSize: 20);

  // Body font: Inter
  static TextStyle get body => GoogleFonts.inter(
    color: AppColors.body,
  );

  static TextStyle get bodyMedium => GoogleFonts.inter(
    fontWeight: FontWeight.w500,
    color: AppColors.body,
  );

  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 12,
    color: AppColors.body.withValues(alpha: 0.7),
  );
}
