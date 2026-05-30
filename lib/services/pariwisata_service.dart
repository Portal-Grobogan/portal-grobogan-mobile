import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pariwisata.dart';

class PariwisataService {
  PariwisataService(this._client);
  final SupabaseClient _client;

  Future<List<Pariwisata>> getAllPariwisata() async {
    final data = await _client.from('pariwisata').select().order('created_at', ascending: false);
    final rows = (data as List).cast<Map<String, dynamic>>();
    return rows.map(Pariwisata.fromJson).toList();
  }
}
