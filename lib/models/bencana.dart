class Bencana {
  const Bencana({
    required this.id,
    required this.judul,
    required this.lokasi,
    required this.tingkatBahaya,
    required this.deskripsi,
    required this.lat,
    required this.lng,
    required this.aktif,
    required this.createdAt,
  });

  final String id;
  final String? judul;
  final String? lokasi;
  final String? tingkatBahaya;
  final String? deskripsi;
  final double? lat;
  final double? lng;
  final bool? aktif;
  final DateTime? createdAt;

  factory Bencana.fromJson(Map<String, dynamic> map) {
    return Bencana(
      id: (map['id'] ?? '').toString(),
      judul: map['judul']?.toString(),
      lokasi: map['lokasi']?.toString(),
      tingkatBahaya: map['tingkat_bahaya']?.toString(),
      deskripsi: map['deskripsi']?.toString(),
      lat: _tryParseDouble(map['lat']),
      lng: _tryParseDouble(map['lng']),
      aktif: map['aktif'] is bool ? map['aktif'] as bool : null,
      createdAt: _tryParseDate(map['created_at']),
    );
  }
}

double? _tryParseDouble(Object? value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}

DateTime? _tryParseDate(Object? value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  return DateTime.tryParse(value.toString());
}

