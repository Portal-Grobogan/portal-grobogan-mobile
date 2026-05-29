// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_slides_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(heroSlides)
final heroSlidesProvider = HeroSlidesProvider._();

final class HeroSlidesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<HeroSlide>>,
          List<HeroSlide>,
          FutureOr<List<HeroSlide>>
        >
    with $FutureModifier<List<HeroSlide>>, $FutureProvider<List<HeroSlide>> {
  HeroSlidesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'heroSlidesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$heroSlidesHash();

  @$internal
  @override
  $FutureProviderElement<List<HeroSlide>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<HeroSlide>> create(Ref ref) {
    return heroSlides(ref);
  }
}

String _$heroSlidesHash() => r'644f36fed27948ebf448a8e3fc47568bc680199e';
