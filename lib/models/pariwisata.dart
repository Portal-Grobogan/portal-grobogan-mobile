class Pariwisata {
  final String id;
  final String nama;
  final String alamat;
  final String? deskripsi;
  final String? imageUrl;
  final String kategori;
  final double? lat;
  final double? lng;

  const Pariwisata({
    required this.id,
    required this.nama,
    required this.alamat,
    this.deskripsi,
    this.imageUrl,
    required this.kategori,
    this.lat,
    this.lng,
  });

  factory Pariwisata.fromJson(Map<String, dynamic> json) {
    return Pariwisata(
      id: json['id'].toString(),
      nama: json['nama'].toString(),
      alamat: json['alamat'].toString(),
      deskripsi: json['deskripsi']?.toString(),
      imageUrl: json['image_url']?.toString(),
      kategori: json['kategori']?.toString() ?? 'Umum',
      lat: _tryParseDouble(json['lat']),
      lng: _tryParseDouble(json['lng']),
    );
  }
}

double? _tryParseDouble(Object? value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  return double.tryParse(value.toString());
}
