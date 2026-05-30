// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layanan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(layananService)
final layananServiceProvider = LayananServiceProvider._();

final class LayananServiceProvider
    extends $FunctionalProvider<LayananService, LayananService, LayananService>
    with $Provider<LayananService> {
  LayananServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'layananServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$layananServiceHash();

  @$internal
  @override
  $ProviderElement<LayananService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LayananService create(Ref ref) {
    return layananService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LayananService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LayananService>(value),
    );
  }
}

String _$layananServiceHash() => r'fc145f0169a1591b2571cba93290f41d5dbab1b3';

@ProviderFor(semuaLayanan)
final semuaLayananProvider = SemuaLayananProvider._();

final class SemuaLayananProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Layanan>>,
          List<Layanan>,
          FutureOr<List<Layanan>>
        >
    with $FutureModifier<List<Layanan>>, $FutureProvider<List<Layanan>> {
  SemuaLayananProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'semuaLayananProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$semuaLayananHash();

  @$internal
  @override
  $FutureProviderElement<List<Layanan>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Layanan>> create(Ref ref) {
    return semuaLayanan(ref);
  }
}

String _$semuaLayananHash() => r'3a9df55719ea19d1582f3553ae6279e0d4c90cfb';
