import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/layanan.dart';

class LayananService {
  LayananService(this._client);
  final SupabaseClient _client;

  Future<List<Layanan>> getAllLayanan({
    bool onlyActive = true,
  }) async {
    final query = _client.from('layanan').select();
    final data = onlyActive
        ? await query.eq('aktif', true).order('urutan', ascending: true)
        : await query.order('urutan', ascending: true);
    final rows = (data as List).cast<Map<String, dynamic>>();
    return rows.map(Layanan.fromJson).toList();
  }
}
