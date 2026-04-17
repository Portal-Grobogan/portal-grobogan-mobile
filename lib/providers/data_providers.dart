import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/bencana.dart';
import '../models/berita.dart';
import '../models/layanan.dart';
import '../models/pengaduan.dart';
import 'services_providers.dart';

final latestBeritaProvider = FutureProvider.autoDispose<List<Berita>>((ref) async {
  final service = ref.watch(beritaServiceProvider);
  return service.fetchLatest(limit: 10, onlyPublished: true);
});

final layananAktifProvider = FutureProvider.autoDispose<List<Layanan>>((ref) async {
  final service = ref.watch(layananServiceProvider);
  return service.fetchAll(onlyActive: true);
});

final bencanaAktifProvider = FutureProvider.autoDispose<List<Bencana>>((ref) async {
  final service = ref.watch(bencanaServiceProvider);
  return service.fetchActive();
});

final bencanaAktifStreamProvider = StreamProvider.autoDispose<List<Bencana>>((ref) {
  final service = ref.watch(bencanaServiceProvider);
  return service.watchActive();
});

final beritaBySlugProvider = FutureProvider.autoDispose.family<Berita?, String>((ref, slug) async {
  final service = ref.watch(beritaServiceProvider);
  return service.fetchBySlug(slug);
});

final pengaduanByIdProvider = FutureProvider.autoDispose.family<Pengaduan?, String>((ref, id) async {
  final service = ref.watch(pengaduanServiceProvider);
  return service.fetchById(id);
});

final pengaduanByIdStreamProvider =
    StreamProvider.autoDispose.family<Pengaduan?, String>((ref, id) {
  final service = ref.watch(pengaduanServiceProvider);
  return service.watchById(id);
});

class CreatePengaduanParams {
  const CreatePengaduanParams({
    required this.namaPelapor,
    required this.email,
    this.nomorHp,
    required this.kategori,
    required this.judul,
    required this.deskripsi,
    this.lampiranFile,
  });

  final String namaPelapor;
  final String email;
  final String? nomorHp;
  final String kategori;
  final String judul;
  final String deskripsi;
  final File? lampiranFile;
}

final createPengaduanProvider =
    FutureProvider.autoDispose.family<Pengaduan, CreatePengaduanParams>((ref, params) async {
  final service = ref.watch(pengaduanServiceProvider);
  return service.createPengaduan(
    namaPelapor: params.namaPelapor,
    email: params.email,
    nomorHp: params.nomorHp,
    kategori: params.kategori,
    judul: params.judul,
    deskripsi: params.deskripsi,
    lampiranFile: params.lampiranFile,
  );
});

