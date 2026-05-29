import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/berita.dart';
import '../services/berita_service.dart';
import 'supabase_provider.dart';

part 'berita_provider.g.dart';

@riverpod
BeritaService beritaService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return BeritaService(client);
}

@riverpod
Future<List<Berita>> beritaTerbaru(Ref ref) {
  return ref.watch(beritaServiceProvider).getBeritaTerbaru(limit: 10);
}

@riverpod
Future<Berita?> beritaBySlug(Ref ref, String slug) {
  return ref.watch(beritaServiceProvider).getBeritaBySlug(slug);
}
