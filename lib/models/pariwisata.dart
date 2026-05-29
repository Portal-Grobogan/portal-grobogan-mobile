class Pariwisata {
  const Pariwisata({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.alamat,
    required this.fotoUrls,
    required this.kategori,
    required this.lat,
    required this.lng,
  });

  final String id;
  final String nama;
  final String? deskripsi;
  final String? alamat;
  final List<String> fotoUrls;
  final String? kategori;
  final double? lat;
  final double? lng;

  factory Pariwisata.fromJson(Map<String, dynamic> map) {
    List<String> parseFotoUrls(dynamic data) {
      if (data == null) return [];
      if (data is List) {
        return data.map((e) => e.toString()).toList();
      }
      return [];
    }

    return Pariwisata(
      id: (map['id'] ?? '').toString(),
      nama: (map['nama'] ?? '').toString(),
      deskripsi: map['deskripsi']?.toString(),
      alamat: map['alamat']?.toString(),
      fotoUrls: parseFotoUrls(map['foto_urls']),
      kategori: map['kategori']?.toString(),
      lat: _tryParseDouble(map['lat']),
      lng: _tryParseDouble(map['lng']),
    );
  }
}

double? _tryParseDouble(Object? value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}
