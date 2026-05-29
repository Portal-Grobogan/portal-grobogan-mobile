// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berita_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(beritaService)
final beritaServiceProvider = BeritaServiceProvider._();

final class BeritaServiceProvider
    extends $FunctionalProvider<BeritaService, BeritaService, BeritaService>
    with $Provider<BeritaService> {
  BeritaServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'beritaServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$beritaServiceHash();

  @$internal
  @override
  $ProviderElement<BeritaService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BeritaService create(Ref ref) {
    return beritaService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BeritaService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BeritaService>(value),
    );
  }
}

String _$beritaServiceHash() => r'7bb8dc1481c073d6092662b37b30821516afc235';

@ProviderFor(beritaTerbaru)
final beritaTerbaruProvider = BeritaTerbaruProvider._();

final class BeritaTerbaruProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Berita>>,
          List<Berita>,
          FutureOr<List<Berita>>
        >
    with $FutureModifier<List<Berita>>, $FutureProvider<List<Berita>> {
  BeritaTerbaruProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'beritaTerbaruProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$beritaTerbaruHash();

  @$internal
  @override
  $FutureProviderElement<List<Berita>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Berita>> create(Ref ref) {
    return beritaTerbaru(ref);
  }
}

String _$beritaTerbaruHash() => r'adfd584269dfc078d2686bd5c812443d4c26ae95';

@ProviderFor(beritaBySlug)
final beritaBySlugProvider = BeritaBySlugFamily._();

final class BeritaBySlugProvider
    extends $FunctionalProvider<AsyncValue<Berita?>, Berita?, FutureOr<Berita?>>
    with $FutureModifier<Berita?>, $FutureProvider<Berita?> {
  BeritaBySlugProvider._({
    required BeritaBySlugFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'beritaBySlugProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$beritaBySlugHash();

  @override
  String toString() {
    return r'beritaBySlugProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Berita?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Berita?> create(Ref ref) {
    final argument = this.argument as String;
    return beritaBySlug(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BeritaBySlugProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$beritaBySlugHash() => r'158e0f510680f60bbf61bfa0f65b56091ec012e7';

final class BeritaBySlugFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Berita?>, String> {
  BeritaBySlugFamily._()
    : super(
        retry: null,
        name: r'beritaBySlugProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BeritaBySlugProvider call(String slug) =>
      BeritaBySlugProvider._(argument: slug, from: this);

  @override
  String toString() => r'beritaBySlugProvider';
}
