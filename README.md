# Portal Grobogan — Mobile App

Aplikasi mobile resmi untuk Portal Kabupaten Grobogan, dibangun menggunakan Flutter, Riverpod, dan Supabase.

---

## 🛠️ Cara Instalasi & Setup

Ikuti panduan berikut untuk menjalankan proyek ini di perangkat lokal Anda setelah melakukan *clone* dari repository GitHub.

### 1. Kebutuhan Sistem (Prerequisites)
Pastikan hal-hal berikut sudah ter-install di komputer Anda:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi 3.0 ke atas)
- [Dart SDK](https://dart.dev/get-dart)
- IDE yang mendukung Flutter (disarankan **VS Code** atau **Android Studio**)
- Emulator Android / iOS Simulator (atau langsung menggunakan HP fisik)

### 2. Clone Repository
Buka terminal Anda dan jalankan perintah berikut:
```bash
git clone https://github.com/Portal-Grobogan/portal-grobogan-mobile.git
cd portal-grobogan-mobile
```

### 3. Install Dependencies
Unduh semua *library/packages* yang dibutuhkan aplikasi:
```bash
flutter pub get
```

### 4. Setup Environment Variabel (.env)
Aplikasi ini menggunakan Supabase yang rahasia API key-nya tidak disertakan di GitHub demi keamanan. Anda perlu membuat file `.env` sendiri.
1. Di direktori paling utama (sejajar dengan `pubspec.yaml`), buat sebuah file baru bernama **`.env`**
2. Salin *template* berikut ke dalam file `.env`:
   ```env
   SUPABASE_URL=https://<KODE_PROJECT_ANDA>.supabase.co
   SUPABASE_ANON_KEY=<KUNCI_ANON_PUBLIC_ANDA>
   ```
3. Ganti `<KODE_PROJECT_ANDA>` dan `<KUNCI_ANON_PUBLIC_ANDA>` dengan kredensial dari *Dashboard* Supabase (Project Settings -> API).

### 5. Konfigurasi Firebase (Push Notification)
Karena aplikasi ini terintegrasi dengan Firebase Cloud Messaging, pastikan Anda menaruh file konfigurasi Firebase:
- **Android**: Download `google-services.json` dari Firebase Console dan letakkan di dalam folder `android/app/`.
- **iOS**: Download `GoogleService-Info.plist` dan letakkan di dalam folder `ios/Runner/`.

### 6. Jalankan Aplikasi
Jika semua setup di atas telah selesai dan Emulator (atau Chrome/Edge) sudah siap, jalankan aplikasinya:
```bash
flutter run
```

---

## 🏗️ Struktur Proyek (Garis Besar)
- `lib/theme/` — Tempat sentralisasi warna (Tailwind), font, dan tema *(Design System)*.
- `lib/widgets/` — Pembuatan *UI Component* seragam (*Card*, *Button*, *Loader*).
- `lib/screens/` — (Segera hadir) Tempat berkumpulnya seluruh halaman *page/screen* aplikasi.

*Dibuat untuk Tugas Akhir / Aplikasi Berbasis Platform Semester 6*
