class Layanan {
  const Layanan({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.iconName,
    required this.urlPath,
    required this.kategori,
    required this.urutan,
    required this.aktif,
  });

  final String id;
  final String nama;
  final String? deskripsi;
  final String? iconName;
  final String? urlPath;
  final String? kategori;
  final int? urutan;
  final bool? aktif;

  factory Layanan.fromMap(Map<String, dynamic> map) {
    return Layanan(
      id: (map['id'] ?? '').toString(),
      nama: (map['nama'] ?? '').toString(),
      deskripsi: map['deskripsi']?.toString(),
      iconName: map['icon_name']?.toString(),
      urlPath: map['url_path']?.toString(),
      kategori: map['kategori']?.toString(),
      urutan: map['urutan'] is int ? map['urutan'] as int : int.tryParse('${map['urutan']}'),
      aktif: map['aktif'] is bool ? map['aktif'] as bool : null,
    );
  }
}

