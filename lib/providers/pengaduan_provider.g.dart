// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengaduan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pengaduanService)
final pengaduanServiceProvider = PengaduanServiceProvider._();

final class PengaduanServiceProvider
    extends
        $FunctionalProvider<
          PengaduanService,
          PengaduanService,
          PengaduanService
        >
    with $Provider<PengaduanService> {
  PengaduanServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pengaduanServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pengaduanServiceHash();

  @$internal
  @override
  $ProviderElement<PengaduanService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PengaduanService create(Ref ref) {
    return pengaduanService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PengaduanService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PengaduanService>(value),
    );
  }
}

String _$pengaduanServiceHash() => r'519028baf0975c636bab8aa4e97232d6f9195e8a';

@ProviderFor(PengaduanNotifier)
final pengaduanProvider = PengaduanNotifierProvider._();

final class PengaduanNotifierProvider
    extends $NotifierProvider<PengaduanNotifier, AsyncValue<void>> {
  PengaduanNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pengaduanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pengaduanNotifierHash();

  @$internal
  @override
  PengaduanNotifier create() => PengaduanNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$pengaduanNotifierHash() => r'7c97d23ece454e48d4e485251b2ea9b94f128b90';

abstract class _$PengaduanNotifier extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(pengaduanDetail)
final pengaduanDetailProvider = PengaduanDetailFamily._();

final class PengaduanDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<Pengaduan?>,
          Pengaduan?,
          FutureOr<Pengaduan?>
        >
    with $FutureModifier<Pengaduan?>, $FutureProvider<Pengaduan?> {
  PengaduanDetailProvider._({
    required PengaduanDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'pengaduanDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pengaduanDetailHash();

  @override
  String toString() {
    return r'pengaduanDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Pengaduan?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Pengaduan?> create(Ref ref) {
    final argument = this.argument as String;
    return pengaduanDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PengaduanDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pengaduanDetailHash() => r'94351fad6d2a20816fbd3c2acbb611a37a0d5eaf';

final class PengaduanDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Pengaduan?>, String> {
  PengaduanDetailFamily._()
    : super(
        retry: null,
        name: r'pengaduanDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PengaduanDetailProvider call(String id) =>
      PengaduanDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'pengaduanDetailProvider';
}
