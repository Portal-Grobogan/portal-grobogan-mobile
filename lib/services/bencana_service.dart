import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/bencana.dart';

class BencanaService {
  BencanaService(this._client);

  final SupabaseClient _client;

  Future<List<Bencana>> fetchActive() async {
    final data = await _client
        .from('bencana')
        .select()
        .eq('aktif', true)
        .order('created_at', ascending: false);

    final rows = (data as List).cast<Map<String, dynamic>>();
    return rows.map(Bencana.fromMap).toList();
  }

  /// Realtime stream untuk bencana aktif.
  Stream<List<Bencana>> watchActive() {
    return _client
        .from('bencana')
        .stream(primaryKey: ['id'])
        .eq('aktif', true)
        .map((rows) => rows.map(Bencana.fromMap).toList());
  }
}

