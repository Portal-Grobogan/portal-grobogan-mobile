// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bencana_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bencanaService)
final bencanaServiceProvider = BencanaServiceProvider._();

final class BencanaServiceProvider
    extends $FunctionalProvider<BencanaService, BencanaService, BencanaService>
    with $Provider<BencanaService> {
  BencanaServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bencanaServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bencanaServiceHash();

  @$internal
  @override
  $ProviderElement<BencanaService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BencanaService create(Ref ref) {
    return bencanaService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BencanaService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BencanaService>(value),
    );
  }
}

String _$bencanaServiceHash() => r'f801353dc43bc5dee03c048519a1861323c112e6';

@ProviderFor(bencanaStream)
final bencanaStreamProvider = BencanaStreamProvider._();

final class BencanaStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Bencana>>,
          List<Bencana>,
          Stream<List<Bencana>>
        >
    with $FutureModifier<List<Bencana>>, $StreamProvider<List<Bencana>> {
  BencanaStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bencanaStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bencanaStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<Bencana>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Bencana>> create(Ref ref) {
    return bencanaStream(ref);
  }
}

String _$bencanaStreamHash() => r'5fc4002340e59633b4de74e81c5f649431a53137';
