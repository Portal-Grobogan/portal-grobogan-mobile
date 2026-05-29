import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/pariwisata.dart';
import '../services/pariwisata_service.dart';
import 'supabase_provider.dart';

part 'pariwisata_provider.g.dart';

@riverpod
PariwisataService pariwisataService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return PariwisataService(client);
}

@riverpod
Future<List<Pariwisata>> semuaDestinasi(Ref ref) {
  return ref.watch(pariwisataServiceProvider).getAllPariwisata();
}
