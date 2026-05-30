import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pengaduan.dart';

class PengaduanService {
  PengaduanService(this._client);
  final SupabaseClient _client;

  Future<String> submitPengaduan({
    required String nama,
    required String email,
    required String nik,
    required String nomorHp,
    required String kategori,
    required String judul,
    required String deskripsi,
    File? lampiran,
  }) async {
    String? lampiranUrl;
    // Insert dulu
    final inserted = await _client
        .from('pengaduan')
        .insert({
          'nama_pelapor': nama,
          'email': email,
          'nik': nik,
          'nomor_hp': nomorHp,
          'kategori': kategori,
          'judul': judul,
          'deskripsi': deskripsi,
          'status': 'baru',
        })
        .select()
        .single();

    final insertedMap = (inserted as Map).cast<String, dynamic>();
    final pengaduanId = (insertedMap['id'] ?? '').toString();

    if (lampiran != null) {
      try {
        final ext = _safeFileExt(lampiran.path);
        final storagePath = '$pengaduanId/lampiran$ext';

        await _client.storage.from('pengaduan-lampiran').upload(
              storagePath,
              lampiran,
              fileOptions: const FileOptions(upsert: true),
            );

        await _client
            .from('pengaduan')
            .update({'lampiran_url': storagePath})
            .eq('id', pengaduanId);
      } catch (e) {
        print('Warning: Gagal mengupload lampiran: $e');
        // Kita biarkan lanjut karena data teks pengaduan sudah berhasil tersimpan.
      }
    }
    return pengaduanId;
  }

  Future<Pengaduan?> cekStatus(String id) async {
    final data = await _client.from('pengaduan').select().eq('id', id).maybeSingle();
    if (data == null) return null;
    return Pengaduan.fromJson((data as Map).cast<String, dynamic>());
  }
}

String _safeFileExt(String path) {
  final dot = path.lastIndexOf('.');
  if (dot == -1) return '';
  final ext = path.substring(dot);
  if (ext.length > 10) return '';
  return ext;
}
