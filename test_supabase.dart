import 'dart:io';
import 'package:supabase/supabase.dart';

void main() async {
  print('Loading .env manually...');
  final envStr = File('.env').readAsStringSync();
  String url = '';
  String key = '';
  for (final line in envStr.split('\n')) {
    if (line.startsWith('SUPABASE_URL=')) url = line.split('=')[1].trim();
    if (line.startsWith('SUPABASE_KEY=')) key = line.split('=')[1].trim();
  }


  print('Supabase URL: $url');
  
  if (url.isEmpty || key.isEmpty) {
    print('Error: Missing URL or KEY');
    exit(1);
  }

  print('Initializing Supabase...');
  final supabase = SupabaseClient(url, key);

  try {
    print('\n--- Querying tabel berita ---');
    final beritaData = await supabase.from('berita').select();
    print('Found ${beritaData.length} records in berita.');
    if (beritaData.isNotEmpty) {
      print('First row sample:');
      print(beritaData.first);
    }
  } catch (e) {
    print('Error querying berita: $e');
  }

  try {
    print('\n--- Querying tabel pengumuman ---');
    final pengumumanData = await supabase.from('pengumuman').select();
    print('Found ${pengumumanData.length} records in pengumuman.');
  } catch (e) {
    print('Error querying pengumuman: $e');
  }

  try {
    print('\n--- Querying tabel hero_slides ---');
    final heroData = await supabase.from('hero_slides').select();
    print('Found ${heroData.length} records in hero_slides.');
  } catch (e) {
    print('Error querying hero_slides: $e');
  }

  try {
    print('\n--- Querying tabel layanan ---');
    final data = await supabase.from('layanan').select();
    print('Found ${data.length} records in layanan.');
  } catch (e) {
    print('Error querying layanan: $e');
  }

  try {
    print('\n--- Querying tabel pariwisata ---');
    final data = await supabase.from('pariwisata').select();
    print('Found ${data.length} records in pariwisata.');
    if (data.isNotEmpty) {
      print('First row: ${data.first}');
    }
  } catch (e) {
    print('Error querying pariwisata: $e');
  }

  try {
    print('\n--- Querying tabel bencana ---');
    final data = await supabase.from('bencana').select();
    print('Found ${data.length} records in bencana.');
    if (data.isNotEmpty) {
      print('First row: ${data.first}');
    }
  } catch (e) {
    print('Error querying bencana: $e');
  }

  exit(0);
}
