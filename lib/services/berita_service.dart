import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/berita.dart';

class BeritaService {
  BeritaService(this._client);
  final SupabaseClient _client;

  Future<List<Berita>> getBeritaTerbaru({
    int limit = 10,
    bool onlyPublished = true,
  }) async {
    final query = _client.from('berita').select();
    final data = onlyPublished
        ? await query.eq('status', 'published').order('created_at', ascending: false).limit(limit)
        : await query.order('created_at', ascending: false).limit(limit);
    final rows = (data as List).cast<Map<String, dynamic>>();
    return rows.map(Berita.fromJson).toList();
  }

  Future<Berita?> getBeritaBySlug(String slug) async {
    final data = await _client.from('berita').select().eq('slug', slug).maybeSingle();
    if (data == null) return null;
    return Berita.fromJson((data as Map).cast<String, dynamic>());
  }

  Future<List<Berita>> searchBerita(String queryStr) async {
    final data = await _client.from('berita')
        .select()
        .eq('status', 'published')
        .ilike('judul', '%$queryStr%')
        .order('created_at', ascending: false);
    final rows = (data as List).cast<Map<String, dynamic>>();
    return rows.map(Berita.fromJson).toList();
  }
}
