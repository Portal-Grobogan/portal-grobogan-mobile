import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pariwisata.dart';

class PariwisataService {
  final SupabaseClient _client;
  
  PariwisataService(this._client);
  
  Future<List<Pariwisata>> getAllDestinasi() async {
    final response = await _client
      .from('pariwisata')
      .select()
      .order('nama', ascending: true);
    
    return (response as List)
      .map((json) => Pariwisata.fromJson(json))
      .toList();
  }
}
