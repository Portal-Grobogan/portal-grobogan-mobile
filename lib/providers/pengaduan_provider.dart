import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/pengaduan.dart';
import '../services/pengaduan_service.dart';
import 'supabase_provider.dart';

part 'pengaduan_provider.g.dart';

@riverpod
PengaduanService pengaduanService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return PengaduanService(client);
}

@riverpod
class PengaduanNotifier extends _$PengaduanNotifier {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.data(null);
  }

  Future<String?> submitPengaduan({
    required String nama,
    required String email,
    required String nik,
    required String nomorHp,
    required String kategori,
    required String judul,
    required String deskripsi,
    File? lampiran,
  }) async {
    state = const AsyncValue.loading();
    try {
      final id = await ref.read(pengaduanServiceProvider).submitPengaduan(
        nama: nama,
        email: email,
        nik: nik,
        nomorHp: nomorHp,
        kategori: kategori,
        judul: judul,
        deskripsi: deskripsi,
        lampiran: lampiran,
      );
      state = const AsyncValue.data(null);
      return id;
    } catch (e, st) {
      print('Submit Pengaduan Error: $e');
      state = AsyncValue.error(e, st);
      return null;
    }
  }
}

@riverpod
Future<Pengaduan?> pengaduanDetail(Ref ref, String id) {
  return ref.watch(pengaduanServiceProvider).cekStatus(id);
}
