import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/pengaduan.dart';

class PengaduanService {
  PengaduanService(this._client);

  final SupabaseClient _client;

  /// Upload lampiran (opsional) ke bucket `pengaduan-lampiran` (private).
  /// Mengembalikan storage path (bukan URL publik).
  Future<String> uploadLampiran({
    required File file,
    required String pengaduanId,
  }) async {
    final ext = _safeFileExt(file.path);
    final storagePath = '$pengaduanId/lampiran$ext';

    await _client.storage.from('pengaduan-lampiran').upload(
          storagePath,
          file,
          fileOptions: const FileOptions(upsert: true),
        );

    return storagePath;
  }

  Future<Pengaduan> createPengaduan({
    required String namaPelapor,
    required String email,
    String? nomorHp,
    required String kategori,
    required String judul,
    required String deskripsi,
    File? lampiranFile,
  }) async {
    // Insert dulu supaya dapat id pengaduan untuk path storage.
    final inserted = await _client
        .from('pengaduan')
        .insert({
          'nama_pelapor': namaPelapor,
          'email': email,
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

    if (lampiranFile != null) {
      final storagePath = await uploadLampiran(
        file: lampiranFile,
        pengaduanId: pengaduanId,
      );

      final updated = await _client
          .from('pengaduan')
          .update({'lampiran_url': storagePath})
          .eq('id', pengaduanId)
          .select()
          .single();

      return Pengaduan.fromMap((updated as Map).cast<String, dynamic>());
    }

    return Pengaduan.fromMap(insertedMap);
  }

  Future<Pengaduan?> fetchById(String id) async {
    final data = await _client.from('pengaduan').select().eq('id', id).maybeSingle();
    if (data == null) return null;
    return Pengaduan.fromMap((data as Map).cast<String, dynamic>());
  }

  /// Realtime stream perubahan pengaduan tertentu.
  Stream<Pengaduan?> watchById(String id) {
    return _client
        .from('pengaduan')
        .stream(primaryKey: ['id'])
        .eq('id', id)
        .map((rows) {
          if (rows.isEmpty) return null;
          return Pengaduan.fromMap(rows.first);
        });
  }
}

String _safeFileExt(String path) {
  final dot = path.lastIndexOf('.');
  if (dot == -1) return '';
  final ext = path.substring(dot);
  if (ext.length > 10) return '';
  return ext;
}

