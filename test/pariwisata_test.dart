import 'package:flutter_test/flutter_test.dart';
import 'package:portal_grobogan/models/pariwisata.dart';

void main() {
  group('Pariwisata Model Test', () {
    test('fromJson should parse correctly', () {
      final json = {
        'id': '1',
        'nama': 'Air Terjun Widuri',
        'alamat': 'Kemadohbatur, Tawangharjo',
        'kategori': 'Alam',
        'lat': -7.0,
        'lng': 110.0,
      };

      final destinasi = Pariwisata.fromJson(json);

      expect(destinasi.id, '1');
      expect(destinasi.nama, 'Air Terjun Widuri');
      expect(destinasi.alamat, 'Kemadohbatur, Tawangharjo');
      expect(destinasi.kategori, 'Alam');
      expect(destinasi.lat, -7.0);
      expect(destinasi.lng, 110.0);
      expect(destinasi.deskripsi, null);
    });
  });
}
