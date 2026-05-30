class Pengaduan {
  const Pengaduan({
    required this.id,
    required this.namaPelapor,
    required this.email,
    required this.nik,
    required this.nomorHp,
    required this.kategori,
    required this.judul,
    required this.deskripsi,
    required this.status,
    required this.lampiranUrl,
    required this.adminNotes,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String? namaPelapor;
  final String? email;
  final String? nik;
  final String? nomorHp;
  final String? kategori;
  final String? judul;
  final String? deskripsi;
  final String? status;
  final String? lampiranUrl;
  final String? adminNotes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Pengaduan.fromJson(Map<String, dynamic> map) {
    return Pengaduan(
      id: (map['id'] ?? '').toString(),
      namaPelapor: map['nama_pelapor']?.toString(),
      email: map['email']?.toString(),
      nik: map['nik']?.toString(),
      nomorHp: map['nomor_hp']?.toString(),
      kategori: map['kategori']?.toString(),
      judul: map['judul']?.toString(),
      deskripsi: map['deskripsi']?.toString(),
      status: map['status']?.toString(),
      lampiranUrl: map['lampiran_url']?.toString(),
      adminNotes: map['admin_notes']?.toString(),
      createdAt: _tryParseDate(map['created_at']),
      updatedAt: _tryParseDate(map['updated_at']),
    );
  }
}

DateTime? _tryParseDate(Object? value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  return DateTime.tryParse(value.toString());
}

