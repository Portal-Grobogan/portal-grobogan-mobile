# Portal Grobogan — Mobile App

Aplikasi mobile resmi untuk Portal Kabupaten Grobogan, dibangun menggunakan **Flutter**, **Riverpod**, dan **Supabase**.

---

## 🛠️ Cara Instalasi & Setup (Menjalankan Proyek dari GitHub)

Ikuti panduan berikut langkah demi langkah untuk menjalankan proyek ini di komputer Anda setelah melakukan *clone* dari repository GitHub.

### 1. Kebutuhan Sistem (Prerequisites)
Pastikan hal-hal berikut sudah ter-install:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi 3.0 ke atas)
- [Dart SDK](https://dart.dev/get-dart)
- IDE yang mendukung Flutter (disarankan **VS Code** atau **Android Studio**)
- Emulator Android / iOS Simulator (atau langsung menggunakan HP fisik via kabel USB/Debugging)

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
Aplikasi ini menggunakan Supabase. Kunci API (API Key) bersifat rahasia dan tidak di-push ke GitHub. Oleh karena itu, Anda harus membuat file `.env` sendiri.
1. Di folder paling utama (sejajar dengan file `pubspec.yaml`), buat file baru bernama persis **`.env`**
2. Salin *template* berikut ke dalam file `.env`:
   ```env
   SUPABASE_URL=https://<KODE_PROJECT_ANDA>.supabase.co
   SUPABASE_ANON_KEY=<KUNCI_ANON_PUBLIC_ANDA>
   ```
3. Ganti `<KODE_PROJECT_ANDA>` dan `<KUNCI_ANON_PUBLIC_ANDA>` dengan kredensial dari *Dashboard* Supabase proyek Anda (Masuk ke **Project Settings -> API**).

### 5. Konfigurasi Firebase (Push Notification)
Aplikasi ini memiliki fitur *Push Notification* menggunakan Firebase Cloud Messaging (FCM). Untuk membuatnya berfungsi di perangkat Anda:
1. Pastikan Anda telah meng-install Firebase CLI dan FlutterFire CLI.
2. Di terminal, jalankan perintah integrasi otomatis berikut:
   ```bash
   dart pub global run flutterfire_cli:flutterfire configure
   ```
3. Pilih _Project Firebase_ yang sudah Anda siapkan di [Firebase Console](https://console.firebase.google.com). Perintah ini akan otomatis membuatkan file `lib/firebase_options.dart` dan `google-services.json`.

*(Catatan: Jika Anda tidak mengatur Firebase, aplikasi tetap bisa berjalan, namun fitur notifikasi tidak akan masuk).*

### 6. Code Generation (Riverpod)
Proyek ini menggunakan `riverpod_generator`. Jika terjadi banyak pesan *error* pada provider, Anda perlu men-generate ulang file `.g.dart`:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 7. Jalankan Aplikasi
Jika semua setup di atas telah selesai dan Emulator (atau HP fisik) sudah siap, jalankan aplikasinya:
```bash
flutter run
```

---

## 🏗️ Struktur Proyek (Garis Besar)
- `lib/config/` — Tempat konfigurasi routing (menggunakan `go_router`).
- `lib/models/` — Mendefinisikan struktur data (*Class Models*) yang digunakan dalam aplikasi.
- `lib/providers/` — Berisi _state management_ (menggunakan `Riverpod`) untuk menghubungkan UI dengan Backend/Supabase.
- `lib/screens/` — Tempat berkumpulnya seluruh halaman *page/screen* aplikasi (Beranda, Profil, Berita, Pengaduan, dll).
- `lib/services/` — Layanan khusus (*Notification Service*, dll).
- `lib/theme/` — Tempat sentralisasi warna, tipografi, dan dimensi.
- `lib/widgets/` — Komponen UI *reusable* (*Card*, *Button*, *Loader*, dsb).

*Dibuat untuk Tugas Akhir / Aplikasi Berbasis Platform Semester 6*
