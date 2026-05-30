import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/layanan.dart';
import '../services/layanan_service.dart';
import 'supabase_provider.dart';

part 'layanan_provider.g.dart';

@riverpod
LayananService layananService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return LayananService(client);
}

@riverpod
Future<List<Layanan>> semuaLayanan(Ref ref) {
  return ref.watch(layananServiceProvider).getAllLayanan();
}
