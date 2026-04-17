class Berita {
  const Berita({
    required this.id,
    required this.judul,
    required this.slug,
    required this.konten,
    required this.thumbnailUrl,
    required this.kategori,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String judul;
  final String slug;
  final String konten;
  final String? thumbnailUrl;
  final String? kategori;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Berita.fromMap(Map<String, dynamic> map) {
    return Berita(
      id: (map['id'] ?? '').toString(),
      judul: (map['judul'] ?? '').toString(),
      slug: (map['slug'] ?? '').toString(),
      konten: (map['konten'] ?? '').toString(),
      thumbnailUrl: map['thumbnail_url']?.toString(),
      kategori: map['kategori']?.toString(),
      status: map['status']?.toString(),
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

