import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/pengumuman.dart';
import '../services/pengumuman_service.dart';
import 'supabase_provider.dart';

part 'pengumuman_provider.g.dart';

@riverpod
PengumumanService pengumumanService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return PengumumanService(client);
}

@riverpod
Future<List<Pengumuman>> pengumumanTerbaru(Ref ref) {
  return ref.watch(pengumumanServiceProvider).getPengumumanTerbaru();
}
