import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/bencana.dart';

class BencanaService {
  BencanaService(this._client);
  final SupabaseClient _client;

  Stream<List<Bencana>> getBencanaStream() {
    return _client
        .from('bencana')
        .stream(primaryKey: ['id'])
        .eq('aktif', true)
        .map((rows) => rows.map(Bencana.fromJson).toList());
  }
}
