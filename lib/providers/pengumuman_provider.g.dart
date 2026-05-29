// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengumuman_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pengumumanService)
final pengumumanServiceProvider = PengumumanServiceProvider._();

final class PengumumanServiceProvider
    extends
        $FunctionalProvider<
          PengumumanService,
          PengumumanService,
          PengumumanService
        >
    with $Provider<PengumumanService> {
  PengumumanServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pengumumanServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pengumumanServiceHash();

  @$internal
  @override
  $ProviderElement<PengumumanService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PengumumanService create(Ref ref) {
    return pengumumanService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PengumumanService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PengumumanService>(value),
    );
  }
}

String _$pengumumanServiceHash() => r'05e48d2e91497cc6063c967630fd4ba285054a45';

@ProviderFor(pengumumanTerbaru)
final pengumumanTerbaruProvider = PengumumanTerbaruProvider._();

final class PengumumanTerbaruProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Pengumuman>>,
          List<Pengumuman>,
          FutureOr<List<Pengumuman>>
        >
    with $FutureModifier<List<Pengumuman>>, $FutureProvider<List<Pengumuman>> {
  PengumumanTerbaruProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pengumumanTerbaruProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pengumumanTerbaruHash();

  @$internal
  @override
  $FutureProviderElement<List<Pengumuman>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Pengumuman>> create(Ref ref) {
    return pengumumanTerbaru(ref);
  }
}

String _$pengumumanTerbaruHash() => r'eaa92921ae30bca77217d8255dcb256c78838e2b';
