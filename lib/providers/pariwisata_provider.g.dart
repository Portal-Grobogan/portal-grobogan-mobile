// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pariwisata_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pariwisataService)
final pariwisataServiceProvider = PariwisataServiceProvider._();

final class PariwisataServiceProvider
    extends
        $FunctionalProvider<
          PariwisataService,
          PariwisataService,
          PariwisataService
        >
    with $Provider<PariwisataService> {
  PariwisataServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pariwisataServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pariwisataServiceHash();

  @$internal
  @override
  $ProviderElement<PariwisataService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PariwisataService create(Ref ref) {
    return pariwisataService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PariwisataService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PariwisataService>(value),
    );
  }
}

String _$pariwisataServiceHash() => r'090e6ba6f9271b0af354a3bd028331bfaf8b678a';

@ProviderFor(semuaDestinasi)
final semuaDestinasiProvider = SemuaDestinasiProvider._();

final class SemuaDestinasiProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Pariwisata>>,
          List<Pariwisata>,
          FutureOr<List<Pariwisata>>
        >
    with $FutureModifier<List<Pariwisata>>, $FutureProvider<List<Pariwisata>> {
  SemuaDestinasiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'semuaDestinasiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$semuaDestinasiHash();

  @$internal
  @override
  $FutureProviderElement<List<Pariwisata>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Pariwisata>> create(Ref ref) {
    return semuaDestinasi(ref);
  }
}

String _$semuaDestinasiHash() => r'cad5b628c2a1e1e01b4f4073e317a5ac07453399';
