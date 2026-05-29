import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_colors.dart';

class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  
  const SkeletonLoader({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });
  
  factory SkeletonLoader.card() => SkeletonLoader(
    width: double.infinity,
    height: 200,
    borderRadius: BorderRadius.circular(12),
  );
  
  factory SkeletonLoader.text() => SkeletonLoader(
    width: double.infinity,
    height: 16,
    borderRadius: BorderRadius.circular(4),
  );
  
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray200,
      highlightColor: AppColors.gray100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.gray200,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}
