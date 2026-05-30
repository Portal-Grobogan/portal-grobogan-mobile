import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimensions.dart';
import '../../theme/app_text_styles.dart';

class ProfilDetailScreen extends StatelessWidget {
  final String title;

  const ProfilDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: AppTextStyles.headingLarge),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.charcoal,
      ),
      body: SingleChildScrollView(
        padding: AppDimensions.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderImage(),
            const SizedBox(height: 24),
            Text(
              title,
              style: AppTextStyles.headingLarge,
            ),
            const SizedBox(height: 16),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    IconData icon;
    if (title.contains('Visi')) {
      icon = Icons.visibility;
    } else if (title.contains('Sejarah')) {
      icon = Icons.history_edu;
    } else if (title.contains('Struktur')) {
      icon = Icons.account_tree;
    } else if (title.contains('Hubungi')) {
      icon = Icons.contact_phone;
    } else if (title.contains('FAQ')) {
      icon = Icons.question_answer;
    } else {
      icon = Icons.shield;
    }

    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.electricBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Icon(icon, size: 80, color: AppColors.electricBlue),
      ),
    );
  }

  Widget _buildContent() {
    String content = '';
    
    if (title == 'Visi & Misi') {
      content = '''
Visi:
"Grobogan Hebat, Maju, dan Sejahtera Berbasis Potensi Lokal"

Misi:
1. Meningkatkan kualitas sumber daya manusia melalui pendidikan dan kesehatan yang merata.
2. Memperkuat ekonomi kerakyatan melalui pemberdayaan UMKM dan optimalisasi sektor pertanian.
3. Mewujudkan tata kelola pemerintahan yang baik, transparan, dan akuntabel.
4. Meningkatkan pembangunan infrastruktur daerah yang berwawasan lingkungan.
5. Melestarikan seni budaya dan kearifan lokal sebagai daya tarik pariwisata.
''';
    } else if (title == 'Sejarah Singkat') {
      content = '''
Kabupaten Grobogan adalah sebuah kabupaten di Provinsi Jawa Tengah, Indonesia. Ibukotanya adalah Purwodadi. 

Kabupaten ini merupakan kabupaten terluas kedua di Jawa Tengah setelah Kabupaten Cilacap. Grobogan berbatasan dengan Kabupaten Blora di timur, Kabupaten Ngawi (Jawa Timur), Kabupaten Sragen, dan Kabupaten Boyolali di selatan, Kabupaten Semarang dan Kabupaten Demak di barat, serta Kabupaten Kudus dan Kabupaten Pati di utara.

Sejarah Kabupaten Grobogan tidak terlepas dari peran Ki Ageng Tarub dan Ki Ageng Selo, yang merupakan leluhur raja-raja Mataram Islam. Grobogan juga dikenal sebagai daerah penghasil pangan, khususnya padi dan palawija, serta memiliki berbagai potensi wisata alam dan sejarah.
''';
    } else if (title == 'Struktur Organisasi') {
      content = '''
Pemerintah Kabupaten Grobogan dipimpin oleh seorang Bupati yang dibantu oleh Wakil Bupati.

Struktur utama terdiri dari:
- Sekretariat Daerah
- Sekretariat DPRD
- Inspektorat
- Dinas Daerah (Kesehatan, Pendidikan, Sosial, dll)
- Badan Daerah (Bappeda, BPPKAD, dll)
- Kecamatan (Total 19 Kecamatan di Grobogan)
- Desa dan Kelurahan

Setiap instansi bekerja sama untuk mewujudkan visi dan misi Kabupaten Grobogan dalam memberikan pelayanan terbaik untuk masyarakat.
''';
    } else if (title == 'Hubungi Kami') {
      content = '''
Pemerintah Kabupaten Grobogan

Alamat:
Jl. Gatot Subroto No. 6, Purwodadi, Kabupaten Grobogan, Jawa Tengah 58111

Telepon:
(0292) 421001

Email:
kominfo@grobogan.go.id

Jam Layanan:
Senin - Kamis : 07.00 - 15.30 WIB
Jumat         : 07.00 - 14.00 WIB
''';
    } else if (title == 'FAQ') {
      content = '''
Q: Bagaimana cara membuat pengaduan?
A: Anda dapat menggunakan fitur 'Pengaduan' pada aplikasi ini. Isi formulir dengan lengkap dan lampirkan foto jika diperlukan.

Q: Apakah layanan darurat tersedia 24 jam?
A: Ya, layanan darurat seperti pemadam kebakaran, BPBD, dan layanan kesehatan tertentu beroperasi selama 24 jam penuh.

Q: Dimana saya bisa melihat status laporan saya?
A: Anda dapat mengecek status laporan pengaduan melalui menu 'Cek Status' di halaman Pengaduan dengan memasukkan nomor tiket.
''';
    } else if (title == 'Kebijakan Privasi') {
      content = '''
Pemerintah Kabupaten Grobogan berkomitmen untuk melindungi privasi setiap pengguna aplikasi Portal Grobogan.

1. Pengumpulan Data: Kami hanya mengumpulkan data yang diperlukan untuk layanan spesifik, seperti nama dan nomor identitas saat Anda membuat laporan pengaduan.
2. Penggunaan Data: Data yang terkumpul akan digunakan secara eksklusif untuk tindak lanjut layanan publik dan tidak akan dibagikan kepada pihak ketiga untuk kepentingan komersial.
3. Keamanan Data: Kami menggunakan standar keamanan terbaru untuk melindungi data Anda dari akses yang tidak sah.

Dengan menggunakan aplikasi ini, Anda setuju dengan kebijakan privasi yang berlaku.
''';
    } else {
      content = 'Informasi untuk $title belum tersedia.';
    }

    return Text(
      content,
      style: AppTextStyles.bodyLarge.copyWith(height: 1.6),
    );
  }
}
