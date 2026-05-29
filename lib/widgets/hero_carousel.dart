import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/hero_slide.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'skeleton_loader.dart';
import 'app_button.dart';

class HeroCarousel extends StatefulWidget {
  final List<HeroSlide> slides;

  const HeroCarousel({super.key, required this.slides});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.slides.isEmpty) {
      return SkeletonLoader.card();
    }

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 240.0,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: widget.slides.map((slide) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background Image
                    CachedNetworkImage(
                      imageUrl: slide.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SkeletonLoader.card(),
                      errorWidget: (context, url, error) => Container(
                        color: AppColors.gray200,
                        child: const Icon(Icons.broken_image),
                      ),
                    ),
                    // Gradient Overlay
                    Container(
                      decoration: const BoxDecoration(
                        gradient: AppColors.heroGradient,
                      ),
                    ),
                    // Content
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            slide.title,
                            style: AppTextStyles.displayMedium.copyWith(color: AppColors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            slide.subtitle,
                            style: AppTextStyles.bodyMedium.copyWith(color: AppColors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 16),
                          AppButton(
                            label: 'Selengkapnya',
                            variant: AppButtonVariant.secondary,
                            onPressed: () {
                              // Navigation logic using slide.linkUrl handled outside or via router
                            },
                          ),
                          const SizedBox(height: 24), // Space for indicators
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        // Indicators
        Positioned(
          bottom: 16.0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.slides.asMap().entries.map((entry) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? AppColors.electricBlue
                      : AppColors.gray200.withOpacity(0.5),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
