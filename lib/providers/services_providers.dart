import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/supabase_client_provider.dart';
import '../services/berita_service.dart';
import '../services/bencana_service.dart';
import '../services/layanan_service.dart';
import '../services/pengaduan_service.dart';

final beritaServiceProvider = Provider<BeritaService>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return BeritaService(client);
});

final layananServiceProvider = Provider<LayananService>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return LayananService(client);
});

final pengaduanServiceProvider = Provider<PengaduanService>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return PengaduanService(client);
});

final bencanaServiceProvider = Provider<BencanaService>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return BencanaService(client);
});

