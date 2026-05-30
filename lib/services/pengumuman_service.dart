import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pengumuman.dart';

class PengumumanService {
  PengumumanService(this._client);
  final SupabaseClient _client;

  Future<List<Pengumuman>> getPengumumanTerbaru({
    int limit = 10,
    bool onlyActive = true,
  }) async {
    final query = _client.from('pengumuman').select();
    final data = onlyActive
        ? await query.eq('aktif', true).order('created_at', ascending: false).limit(limit)
        : await query.order('created_at', ascending: false).limit(limit);
    final rows = (data as List).cast<Map<String, dynamic>>();
    return rows.map(Pengumuman.fromJson).toList();
  }
}
