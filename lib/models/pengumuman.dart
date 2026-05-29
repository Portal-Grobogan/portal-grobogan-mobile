class Pengumuman {
  const Pengumuman({
    required this.id,
    required this.judul,
    required this.konten,
    required this.fileUrl,
    required this.aktif,
    required this.createdAt,
  });

  final String id;
  final String judul;
  final String konten;
  final String? fileUrl;
  final bool? aktif;
  final DateTime? createdAt;

  factory Pengumuman.fromJson(Map<String, dynamic> map) {
    return Pengumuman(
      id: (map['id'] ?? '').toString(),
      judul: (map['judul'] ?? '').toString(),
      konten: (map['konten'] ?? '').toString(),
      fileUrl: map['file_url']?.toString(),
      aktif: map['aktif'] is bool ? map['aktif'] as bool : null,
      createdAt: _tryParseDate(map['created_at']),
    );
  }
}

DateTime? _tryParseDate(Object? value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  return DateTime.tryParse(value.toString());
}
