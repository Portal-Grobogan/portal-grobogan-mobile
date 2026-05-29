# Mobile App PRD — Portal Grobogan
**Platform:** Flutter (Android & iOS)  
**Version:** 1.0.0  
**Design:** Minimalist-Modern with Electric Blue Identity  
**Status:** Ready for Development

---

## 1. Executive Summary

Portal Grobogan Mobile adalah aplikasi cross-platform yang memberikan akses mudah ke layanan publik, berita, pengaduan masyarakat, dan informasi kebencanaan real-time untuk warga Kabupaten Grobogan.

**Key Differentiators:**
- Bold Electric Blue visual identity dengan gradient signatures
- Real-time disaster alerts dengan push notifications
- Offline-capable dengan smart caching
- Micro-interactions untuk premium feel
- Clean, minimalist UI yang mudah digunakan semua kalangan

---

## 2. Design System

### 2.1 Design Principles

**"Confidence Without Clutter"**

1. **Bold Minimalism** — Whitespace generous, fokus pada konten
2. **Electric Energy** — Gradients dan animasi halus untuk dinamisme
3. **Inverted Contrast** — Dark sections untuk visual rhythm
4. **Micro-Interactions** — Setiap tap, scroll, dan transisi terasa premium
5. **Readability First** — Hierarchy ketat, kontras tinggi

### 2.2 Color Palette

#### Primary Colors
```dart
// Electric Blue System
static const Color electricBlue = Color(0xFF0066FF);        // Primary
static const Color electricBlueDark = Color(0xFF0052CC);    // Hover/Active
static const Color electricBlueLight = Color(0xFF3385FF);   // Tint

// Gradient Signature
static const Gradient primaryGradient = LinearGradient(
  colors: [Color(0xFF0066FF), Color(0xFF00A3FF)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

// Inverted Sections
static const Color charcoal = Color(0xFF1A1D29);           // Dark backgrounds
static const Color charcoalLight = Color(0xFF2D3142);      // Card on dark
```

#### Supporting Colors
```dart
// Neutrals
static const Color white = Color(0xFFFFFFFF);
static const Color offWhite = Color(0xFFF8F9FA);
static const Color gray50 = Color(0xFFF9FAFB);
static const Color gray100 = Color(0xFFF3F4F6);
static const Color gray200 = Color(0xFFE5E7EB);
static const Color gray500 = Color(0xFF6B7280);
static const Color gray900 = Color(0xFF111827);

// Semantic Colors
static const Color success = Color(0xFF10B981);           // Green
static const Color warning = Color(0xFFF59E0B);           // Amber
static const Color danger = Color(0xFFEF4444);            // Red
static const Color info = Color(0xFF3B82F6);              // Blue

// Accent Colors (digunakan hemat)
static const Color accentGold = Color(0xFFFFB800);        // Badges, highlights
```

### 2.3 Typography

#### Font Families
- **Display/Headings:** Calistoga (Google Fonts) — Bold, playful, memorable
- **Body/UI:** Inter (Google Fonts) — Clean, highly readable

#### Text Styles
```dart
// Display/Headings
static const TextStyle displayLarge = TextStyle(
  fontFamily: 'Calistoga',
  fontSize: 32,
  fontWeight: FontWeight.w400, // Calistoga already bold
  height: 1.2,
  letterSpacing: -0.5,
  color: charcoal,
);

static const TextStyle displayMedium = TextStyle(
  fontFamily: 'Calistoga',
  fontSize: 24,
  fontWeight: FontWeight.w400,
  height: 1.3,
  color: charcoal,
);

static const TextStyle headingLarge = TextStyle(
  fontFamily: 'Calistoga',
  fontSize: 20,
  fontWeight: FontWeight.w400,
  height: 1.4,
  color: charcoal,
);

// Body Text
static const TextStyle bodyLarge = TextStyle(
  fontFamily: 'Inter',
  fontSize: 16,
  fontWeight: FontWeight.w400,
  height: 1.6,
  color: gray900,
);

static const TextStyle bodyMedium = TextStyle(
  fontFamily: 'Inter',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  height: 1.5,
  color: gray900,
);

static const TextStyle bodySmall = TextStyle(
  fontFamily: 'Inter',
  fontSize: 12,
  fontWeight: FontWeight.w400,
  height: 1.4,
  color: gray500,
);

// Labels & Buttons
static const TextStyle labelMedium = TextStyle(
  fontFamily: 'Inter',
  fontSize: 14,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.3,
  color: gray900,
);

static const TextStyle buttonText = TextStyle(
  fontFamily: 'Inter',
  fontSize: 15,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.2,
  color: white,
);
```

### 2.4 Spacing System

```dart
// Consistent 8px grid
static const double spacing4 = 4.0;
static const double spacing8 = 8.0;
static const double spacing12 = 12.0;
static const double spacing16 = 16.0;
static const double spacing20 = 20.0;
static const double spacing24 = 24.0;
static const double spacing32 = 32.0;
static const double spacing48 = 48.0;
static const double spacing64 = 64.0;

// Screen Padding
static const EdgeInsets screenPadding = EdgeInsets.all(20.0);
static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
```

### 2.5 Border Radius

```dart
static const double radiusSmall = 8.0;
static const double radiusMedium = 12.0;
static const double radiusLarge = 16.0;
static const double radiusXL = 24.0;
static const double radiusFull = 9999.0;
```

### 2.6 Shadows

```dart
// Card Shadows
static const List<BoxShadow> shadowSmall = [
  BoxShadow(
    color: Color(0x0A000000), // 4% black
    offset: Offset(0, 1),
    blurRadius: 3,
  ),
];

static const List<BoxShadow> shadowMedium = [
  BoxShadow(
    color: Color(0x14000000), // 8% black
    offset: Offset(0, 4),
    blurRadius: 12,
  ),
];

static const List<BoxShadow> shadowLarge = [
  BoxShadow(
    color: Color(0x1F000000), // 12% black
    offset: Offset(0, 8),
    blurRadius: 24,
  ),
];

// Gradient Shadow (for Electric Blue elements)
static const List<BoxShadow> shadowBlue = [
  BoxShadow(
    color: Color(0x330066FF), // 20% Electric Blue
    offset: Offset(0, 4),
    blurRadius: 16,
  ),
];
```

### 2.7 Animations & Micro-Interactions

```dart
// Duration Standards
static const Duration durationFast = Duration(milliseconds: 150);
static const Duration durationNormal = Duration(milliseconds: 250);
static const Duration durationSlow = Duration(milliseconds: 400);

// Curves
static const Curve curveDefault = Curves.easeInOut;
static const Curve curveSnappy = Curves.easeOutCubic;
static const Curve curveBounce = Curves.elasticOut;

// Haptic Feedback (use sparingly)
// - Light: Tap buttons
// - Medium: Submit forms, important actions
// - Heavy: Errors, critical alerts
```

### 2.8 Iconography

**Icon Set:** Material Symbols (Outlined variant)
- **Stroke Weight:** 300 (light)
- **Optical Size:** 24px
- **Color:** Inherit dari parent atau explicit gray500/electricBlue

**Icon Sizing:**
- Small: 20x20px
- Medium: 24x24px (default)
- Large: 32x32px
- XL: 48x48px (hero sections)

---

## 3. Component Library

### 3.1 AppCard

**Standard Card Container**

```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: shadowSmall,
    border: Border.all(color: gray200, width: 1),
  ),
  child: content,
);
```

**Variants:**
- `AppCard.elevated` — shadow medium, no border
- `AppCard.outlined` — border only, no shadow
- `AppCard.dark` — charcoalLight background untuk inverted sections

### 3.2 AppButton

**Primary Button**
```dart
Container(
  height: 48,
  decoration: BoxDecoration(
    gradient: primaryGradient,
    borderRadius: BorderRadius.circular(12),
    boxShadow: shadowBlue,
  ),
  child: Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Center(
        child: Text('Button Label', style: buttonText),
      ),
    ),
  ),
);
```

**Variants:**
- `AppButton.primary` — Electric Blue gradient + shadow
- `AppButton.secondary` — white background, Electric Blue text, border
- `AppButton.ghost` — transparent, Electric Blue text
- `AppButton.danger` — red solid color

**States:**
- Default: Full opacity
- Pressed: 0.8 opacity + scale 0.98
- Disabled: 0.5 opacity, no interaction

### 3.3 AppBadge

**Status/Category Badge**

```dart
Container(
  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  decoration: BoxDecoration(
    color: badgeColor.withOpacity(0.1),
    borderRadius: BorderRadius.circular(radiusFull),
  ),
  child: Text(
    label,
    style: TextStyle(
      fontFamily: 'Inter',
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: badgeColor,
      letterSpacing: 0.5,
    ),
  ),
);
```

**Badge Colors:**
- Berita: Electric Blue
- Pengumuman: Accent Gold
- Bencana (Aman): Success Green
- Bencana (Waspada): Warning Amber
- Bencana (Bahaya): Danger Red
- Status (Diterima): Gray
- Status (Proses): Info Blue
- Status (Selesai): Success Green

### 3.4 AppBottomNav

**Bottom Navigation Bar**

```dart
BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: white,
  selectedItemColor: electricBlue,
  unselectedItemColor: gray500,
  selectedLabelStyle: TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w600,
  ),
  unselectedLabelStyle: TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Beranda',
    ),
    // ... 4 more items
  ],
);
```

**5 Tabs:**
1. Beranda (home)
2. Layanan (grid_view)
3. Pengaduan (description)
4. Berita (article)
5. Profil (person)

### 3.5 HeroCarousel

**Homepage Hero Slider**

- **Height:** 240px
- **Indicator:** Electric Blue dots di bottom center
- **Auto-play:** 5 seconds
- **Image Overlay:** `LinearGradient` dari transparent ke `rgba(0,0,0,0.6)` bottom
- **Text:** White, Calistoga heading + Inter subtitle
- **CTA Button:** White outline, onTap → navigation

### 3.6 NewsCard

**Berita List Item**

```
┌─────────────────────────────┐
│  [Thumbnail 16:9 ratio]     │
├─────────────────────────────┤
│ Badge Kategori              │
│                             │
│ Judul Berita (2 lines max)  │
│                             │
│ 📅 14 Apr 2026 • 👤 Admin   │
└─────────────────────────────┘
```

- **Thumbnail:** `CachedNetworkImage`, BoxFit.cover, `borderRadius` top 12px
- **Badge:** Top-left absolute overlay
- **Spacing:** Padding 12px dalam card
- **Tap:** Haptic light + navigate

### 3.7 ServiceCard

**Layanan Grid Item**

```
┌───────────┐
│   [Icon]  │
│           │
│  Label    │
└───────────┘
```

- **Size:** Square, min 100x100
- **Icon:** Material Symbol 32px, Electric Blue
- **Label:** Inter 13px semibold, center aligned, max 2 lines
- **Background:** White with border gray200
- **Hover:** Scale 1.02 + shadowMedium

### 3.8 DisasterAlert

**Bencana Real-time Card**

```
┌─────────────────────────────────────┐
│ 🔴 BAHAYA                           │
│                                     │
│ Banjir di Kecamatan Toroh           │
│ Ketinggian air 1.5m, segera evakuasi│
│                                     │
│ 📍 Desa Toroh Kidul                 │
│ 🕐 14 Apr 2026, 14:30 WIB           │
└─────────────────────────────────────┘
```

- **Color-coded:** Red/Amber/Green border 3px left
- **Background:** Tinted dengan danger/warning/success @ 5% opacity
- **Icon:** Animated pulse untuk status BAHAYA
- **Real-time:** Stream dari Supabase Realtime

### 3.9 SkeletonLoader

**Loading Placeholder**

```dart
Shimmer.fromColors(
  baseColor: gray200,
  highlightColor: gray100,
  child: Container(
    height: 200,
    decoration: BoxDecoration(
      color: gray200,
      borderRadius: BorderRadius.circular(12),
    ),
  ),
);
```

**Variants:**
- `SkeletonLoader.card` — Card-shaped
- `SkeletonLoader.text` — Single line
- `SkeletonLoader.article` — Image + 3 text lines

### 3.10 EmptyState

**Empty/Error State**

- **Icon:** Material Symbol 64px, gray500
- **Heading:** Calistoga 20px
- **Description:** Inter 14px gray500
- **Action Button:** AppButton.secondary "Muat Ulang"

---

## 4. Screen Architecture

### 4.1 Navigation Structure

```
ScaffoldWithBottomNavBar (Shell Route)
├── BerandaScreen (/)
├── LayananScreen (/layanan)
├── PengaduanScreen (/pengaduan)
├── BeritaScreen (/berita)
└── ProfilScreen (/profil)

Detail Screens (Pushed on top)
├── BeritaDetailScreen (/berita/:slug)
├── LayananDetailScreen (/layanan/:id)
├── PengaduanCekScreen (/pengaduan/cek)
├── PengaduanSuksesScreen (/pengaduan/sukses/:id)
└── PariwisataScreen (/pariwisata)
```

### 4.2 Deep Linking

**Supported URLs:**
- `portalgrobogan://beranda`
- `portalgrobogan://berita/{slug}`
- `portalgrobogan://layanan/kebencanaan`
- `portalgrobogan://pengaduan/cek?id={id}`

**From Push Notification:**
- Bencana → `/layanan/kebencanaan`
- Pengaduan Update → `/pengaduan/cek?id={id}`
- Berita Baru → `/berita/{slug}`

---

## 5. Screen Specifications

### 5.1 BerandaScreen

**Layout:**
```
AppBar (gradient background)
└─ "Portal Grobogan" Calistoga white

ScrollView
├─ HeroCarousel (240px height)
├─ Section: Layanan Unggulan
│  └─ Grid 3 columns, 5 items + "Lihat Semua"
├─ Section: Berita Terkini
│  └─ Horizontal scroll, 3 cards
├─ Section: Pengumuman
│  └─ List 2 items
└─ Section: Kebencanaan (if ada alert)
   └─ DisasterAlert card

FloatingActionButton: "Buat Pengaduan" (Electric Blue gradient)
```

**Data Sources:**
- `hero_slides` (fetch 3 aktif, sort urutan)
- `layanan` (fetch 5 urutan tertinggi)
- `berita` (fetch 5 terbaru, status published)
- `pengumuman` (fetch 2 terbaru, aktif)
- `bencana` (realtime stream, filter aktif)

**Interactions:**
- Pull-to-refresh: Reload semua data
- Hero CTA: Navigate sesuai `link_url`
- Service Card Tap: Navigate `/layanan/{id}`
- Berita Card Tap: Navigate `/berita/{slug}`
- FAB: Navigate `/pengaduan`

### 5.2 LayananScreen

**Layout:**
```
AppBar: "Layanan Publik"

ScrollView
├─ Search Bar (rounded full, icon search)
├─ Section: Semua Layanan
   └─ Grid 2 columns, gap 16px
      ├─ ServiceCard (Kependudukan)
      ├─ ServiceCard (Kesehatan)
      ├─ ServiceCard (Kebencanaan)
      ├─ ServiceCard (Pariwisata)
      └─ ... (dynamic dari DB)
```

**Search:**
- Filter by `nama` contains query (case-insensitive)
- Debounce 300ms

**Tap → LayananDetailScreen:**
- Kependudukan: Info + persyaratan list
- Kesehatan: Jadwal posyandu table
- Kebencanaan: Real-time alerts + peta
- Pariwisata: Navigate `/pariwisata`

### 5.3 LayananDetailScreen (Kebencanaan)

**Layout:**
```
AppBar: "Status Kebencanaan"

ScrollView (realtime stream)
├─ Hero Section (inverted, charcoal background)
│  ├─ Icon alert_triangle 64px white
│  ├─ Heading "Status Terkini" Calistoga white
│  └─ Badge count alert
│
├─ Section: Alert Aktif
│  └─ List DisasterAlert cards
│     (empty state jika tidak ada)
│
├─ Section: Peta Sebaran (opsional MVP)
│  └─ Google Maps Embed / Static Map
│
└─ Section: Kontak Darurat
   └─ Card with phone numbers
      ├─ BPBD: 0292-421xxx
      ├─ Polisi: 110
      └─ PMI: 0292-422xxx
```

**Data:**
- Realtime subscription ke `bencana` (filter `aktif = true`)
- Badge tingkat_bahaya → color mapping

**Interactions:**
- Tap phone number → launch dialer
- Pull-to-refresh (realtime sudah auto-update)

### 5.4 PengaduanScreen

**Layout:**
```
AppBar: "Buat Pengaduan"

ScrollView (Form)
├─ TextField: Nama Pelapor *
├─ TextField: Email *
├─ TextField: Nomor HP *
├─ Dropdown: Kategori * (Infrastruktur, Kesehatan, dll)
├─ TextField: Judul Pengaduan *
├─ TextField: Deskripsi (multiline, min 20 char) *
├─ File Picker: Lampiran (opsional, max 10MB)
│  └─ Preview thumbnail jika ada
│
└─ AppButton.primary: "Kirim Pengaduan"
   (disabled jika form invalid)

Divider
Bottom Section:
└─ TextButton: "Cek Status Pengaduan" → navigate `/pengaduan/cek`
```

**Validation:**
- Required fields: Nama, Email, HP, Kategori, Judul, Deskripsi
- Email format check
- HP min 10 digits
- Deskripsi min 20 characters
- Lampiran: jpg, png, pdf only, max 10MB

**Submit Flow:**
1. Show loading overlay
2. Upload lampiran ke Supabase Storage `pengaduan-lampiran/{uuid}_{filename}`
3. Insert ke `pengaduan` table dengan `lampiran_url`
4. Haptic medium feedback
5. Navigate `/pengaduan/sukses/{id}`

### 5.5 PengaduanSuksesScreen

**Layout:**
```
Centered Column
├─ Icon check_circle 80px success green
├─ Heading "Pengaduan Terkirim!" Calistoga
├─ Text "ID Pengaduan Anda:"
├─ Container (Electric Blue tint background)
│  └─ ID Pengaduan (e.g., PGD-2026-001234)
│     + IconButton copy
├─ Text hint "Simpan ID ini untuk cek status"
│
└─ Buttons
   ├─ AppButton.primary: "Kembali ke Beranda"
   └─ AppButton.secondary: "Cek Status"
```

**Interactions:**
- Copy ID: Haptic light + SnackBar "ID disalin"
- Kembali: pop all → navigate `/`
- Cek Status: navigate `/pengaduan/cek?id={id}`

### 5.6 PengaduanCekScreen

**Layout:**
```
AppBar: "Cek Status Pengaduan"

ScrollView
├─ TextField: ID Pengaduan
│  └─ Suffix IconButton search
│
├─ AppButton.primary: "Cek Status"
│
└─ Result Section (after fetch)
   ├─ Card Detail Pengaduan
   │  ├─ Badge Status (diterima/proses/selesai)
   │  ├─ Judul + Kategori
   │  ├─ Tanggal dibuat
   │  ├─ Deskripsi
   │  ├─ Lampiran (jika ada, preview)
   │  └─ Catatan Admin (jika ada)
   │
   └─ Timeline Status (opsional, MVP skip)
```

**Data:**
- Query `pengaduan` where `id = input`
- Handle not found dengan EmptyState

### 5.7 BeritaScreen

**Layout:**
```
AppBar: "Berita & Pengumuman"

Tabs (Material TabBar)
├─ Tab: Berita
└─ Tab: Pengumuman

TabView
├─ Berita Tab
│  └─ ListView
│     ├─ NewsCard (list, vertical)
│     └─ Load more on scroll bottom
│
└─ Pengumuman Tab
   └─ ListView
      ├─ PengumumanCard (simplified, no thumbnail)
      └─ Load more
```

**NewsCard (Vertical List Variant):**
```
┌────────────────────────────────┐
│ [Thumbnail]     Judul (3 lines)│
│  120x90px       Badge          │
│                 Date • Author  │
└────────────────────────────────┘
```

**Pagination:**
- Lazy load: fetch 10 items per page
- Show `CircularProgressIndicator` at bottom saat load more
- Empty state jika list kosong

### 5.8 BeritaDetailScreen

**Layout:**
```
AppBar: transparent, back button white, gradient overlay

ScrollView
├─ Hero Image (aspect 16:9, parallax scroll effect)
│  └─ Gradient overlay bottom
│
├─ Content Card (rounded top 24px, negative margin -20px)
│  ├─ Badge Kategori
│  ├─ Heading (Calistoga 24px)
│  ├─ Meta (date, author, gray500)
│  ├─ Divider
│  ├─ Body Content (Inter 16px, line-height 1.6)
│  │  └─ HTML content rendered dengan `flutter_html`
│  └─ Share Button (Electric Blue outline)
│
└─ Section: Berita Terkait (optional)
   └─ Horizontal scroll 3 NewsCard
```

**Interactions:**
- Share button: Platform share (title + URL)
- Parallax: Image scale slight zoom on scroll up
- Related articles: Fetch same kategori, exclude current

### 5.9 PariwisataScreen

**Layout:**
```
AppBar: "Wisata Grobogan"

ScrollView
├─ Hero Section (gradient Electric Blue)
│  ├─ Icon luggage 48px white
│  └─ Tagline "Jelajahi Keindahan Grobogan"
│
└─ Grid Destinasi (2 columns)
   └─ DestinasiCard
      ├─ Image (aspect 4:3)
      ├─ Nama (Calistoga 16px)
      ├─ Alamat (Inter 12px, gray500, 1 line)
      └─ Badge Kategori (Alam/Budaya/Kuliner)
```

**Tap → DestinasiDetailScreen (opsional MVP):**
- Gallery swipe foto
- Deskripsi lengkap
- Map location
- Directions button (open Google Maps)

### 5.10 ProfilScreen

**Layout:**
```
AppBar: "Profil"

ScrollView
├─ Hero Section (inverted, charcoal)
│  ├─ Logo Kabupaten Grobogan
│  └─ Nama "Kabupaten Grobogan"
│
├─ Section: Tentang
│  └─ Card text (sejarah singkat)
│
├─ Section: Visi & Misi
│  └─ Card list
│
├─ Section: Kontak
│  └─ Card
│     ├─ Alamat kantor
│     ├─ Phone + tap to call
│     ├─ Email + tap to email
│     └─ Website + tap to open browser
│
└─ Section: Aplikasi
   └─ Card
      ├─ App version
      ├─ Build number
      └─ TextButton: "Ketentuan Layanan"
         TextButton: "Kebijakan Privasi"
```

**Static Content:** No backend fetch, hardcoded in app

---

## 6. State Management — Riverpod

### 6.1 Provider Structure

```
lib/providers/
├─ auth_provider.dart          # Supabase auth state (future: login)
├─ berita_provider.dart         # FutureProvider + StateNotifier
├─ layanan_provider.dart        # FutureProvider
├─ pengaduan_provider.dart      # StateNotifier for form
├─ bencana_provider.dart        # StreamProvider (realtime)
├─ hero_slides_provider.dart    # FutureProvider
└─ pariwisata_provider.dart     # FutureProvider
```

### 6.2 Example: BeritaProvider

```dart
// Fetch berita
final beritaProvider = FutureProvider<List<Berita>>((ref) async {
  final service = ref.read(beritaServiceProvider);
  return service.getBeritaTerbaru(limit: 10);
});

// State for pagination
final beritaStateProvider = StateNotifierProvider<BeritaNotifier, BeritaState>(
  (ref) => BeritaNotifier(ref.read(beritaServiceProvider)),
);

class BeritaState {
  final List<Berita> items;
  final bool isLoading;
  final bool hasMore;
  final String? error;
}
```

### 6.3 Example: BencanaProvider (Realtime)

```dart
final bencanaStreamProvider = StreamProvider<List<Bencana>>((ref) {
  final supabase = ref.read(supabaseClientProvider);
  
  return supabase
    .from('bencana')
    .stream(primaryKey: ['id'])
    .eq('aktif', true)
    .order('created_at', ascending: false)
    .map((data) => data.map((json) => Bencana.fromJson(json)).toList());
});
```

---

## 7. Data Layer — Services

### 7.1 Service Pattern

```
lib/services/
├─ supabase_service.dart       # Singleton client init
├─ berita_service.dart
├─ layanan_service.dart
├─ pengaduan_service.dart
├─ bencana_service.dart
├─ hero_slides_service.dart
└─ pariwisata_service.dart
```

### 7.2 Example: PengaduanService

```dart
class PengaduanService {
  final SupabaseClient _supabase;
  
  Future<String> submitPengaduan({
    required String nama,
    required String email,
    required String nomorHp,
    required String kategori,
    required String judul,
    required String deskripsi,
    File? lampiran,
  }) async {
    // 1. Upload lampiran jika ada
    String? lampiranUrl;
    if (lampiran != null) {
      final fileName = '${Uuid().v4()}_${path.basename(lampiran.path)}';
      final uploadPath = await _supabase.storage
        .from('pengaduan-lampiran')
        .upload(fileName, lampiran);
      
      lampiranUrl = _supabase.storage
        .from('pengaduan-lampiran')
        .getPublicUrl(fileName);
    }
    
    // 2. Insert ke database
    final response = await _supabase
      .from('pengaduan')
      .insert({
        'nama_pelapor': nama,
        'email': email,
        'nomor_hp': nomorHp,
        'kategori': kategori,
        'judul': judul,
        'deskripsi': deskripsi,
        'lampiran_url': lampiranUrl,
        'status': 'diterima',
      })
      .select()
      .single();
    
    return response['id'] as String;
  }
  
  Future<Pengaduan?> cekStatus(String id) async {
    final response = await _supabase
      .from('pengaduan')
      .select()
      .eq('id', id)
      .maybeSingle();
    
    return response != null ? Pengaduan.fromJson(response) : null;
  }
}
```

---

## 8. Push Notifications

### 8.1 Setup

**Firebase Messaging Integration:**
1. Add `firebase_messaging` dependency
2. Configure `google-services.json` (Android) + `GoogleService-Info.plist` (iOS)
3. Request permission on app launch
4. Get FCM token, save to Supabase (opsional: link ke user profile)

### 8.2 Topic Subscription

```dart
await FirebaseMessaging.instance.subscribeToTopic('semua-warga');
await FirebaseMessaging.instance.subscribeToTopic('bencana-darurat');
```

**Topics:**
- `semua-warga` — Berita penting, pengumuman resmi
- `bencana-darurat` — Alert kebencanaan BAHAYA level only

### 8.3 Notification Categories

| Category | Topic | Priority | Sound | Data Payload |
|----------|-------|----------|-------|--------------|
| Bencana Darurat | bencana-darurat | high | alarm.mp3 | `{type: 'bencana', id: '{id}'}` |
| Update Pengaduan | - | default | default | `{type: 'pengaduan', id: '{id}'}` |
| Berita Baru | semua-warga | default | default | `{type: 'berita', slug: '{slug}'}` |

### 8.4 Handling Notifications

```dart
// Foreground
FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  // Show in-app notification (SnackBar atau overlay)
  showInAppNotification(message);
});

// Background/Terminated → tap to open
FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  handleNotificationTap(message.data);
});

// App launched from terminated via notification
RemoteMessage? initialMessage = 
  await FirebaseMessaging.instance.getInitialMessage();
if (initialMessage != null) {
  handleNotificationTap(initialMessage.data);
}

void handleNotificationTap(Map<String, dynamic> data) {
  final type = data['type'];
  
  switch (type) {
    case 'bencana':
      context.go('/layanan/kebencanaan');
      break;
    case 'pengaduan':
      context.go('/pengaduan/cek?id=${data['id']}');
      break;
    case 'berita':
      context.go('/berita/${data['slug']}');
      break;
  }
}
```

### 8.5 Notification Permissions Screen (Optional)

**Onboarding flow:**
- Screen 1: Welcome
- Screen 2: Feature intro
- Screen 3: **Enable Notifications** (with benefits listed)
  - "Dapatkan update darurat kebencanaan"
  - "Pantau status pengaduan Anda"
  - "Info berita terkini dari Pemkab"
  - Button: "Aktifkan Notifikasi" → request permission

---

## 9. Offline Support & Caching

### 9.1 Strategy

**What to Cache:**
- Hero slides (cache 1 day)
- Layanan list (cache 1 week, rarely changes)
- Berita list (cache 30 minutes)
- User-submitted pengaduan (local draft until submitted)

**What NOT to Cache:**
- Bencana data (always realtime)
- Pengaduan status check (always fresh)

### 9.2 Implementation

**Image Caching:**
```dart
CachedNetworkImage(
  imageUrl: berita.thumbnailUrl,
  cacheKey: 'berita_${berita.id}',
  maxCacheAge: Duration(days: 7),
  placeholder: (context, url) => SkeletonLoader.card(),
  errorWidget: (context, url, error) => Icon(Icons.broken_image),
);
```

**Data Caching (Hive or SharedPreferences):**
```dart
// Example: Cache layanan
Future<List<Layanan>> getLayanan() async {
  // Check cache
  final cached = await _cache.get('layanan');
  if (cached != null && !_isExpired(cached.timestamp)) {
    return cached.data;
  }
  
  // Fetch from Supabase
  final fresh = await _supabase.from('layanan').select();
  
  // Save to cache
  await _cache.set('layanan', CacheEntry(
    data: fresh,
    timestamp: DateTime.now(),
  ));
  
  return fresh;
}
```

### 9.3 Offline Form Draft

**PengaduanScreen:**
- Autosave form ke local storage tiap field blur
- Restore draft saat screen init
- Clear draft setelah sukses submit

---

## 10. Performance Optimization

### 10.1 Image Optimization

- **Thumbnail Resolution:** Max 800x600px dari backend
- **Lazy Loading:** `cached_network_image` with placeholder
- **Format:** WebP preferred (fallback JPG)

### 10.2 List Optimization

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    // Only build visible items
    return NewsCard(berita: items[index]);
  },
  cacheExtent: 500, // Preload slightly off-screen
);
```

### 10.3 Route Transitions

```dart
// Custom smooth page transition
CustomTransitionPage(
  transitionDuration: Duration(milliseconds: 250),
  child: BeritaDetailScreen(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
      child: child,
    );
  },
);
```

---

## 11. Testing Strategy

### 11.1 Unit Tests

```
test/
├─ models/
│  └─ berita_test.dart          # fromJson, toJson
├─ services/
│  └─ pengaduan_service_test.dart
└─ providers/
   └─ bencana_provider_test.dart
```

### 11.2 Widget Tests

```
test/
├─ widgets/
│  ├─ app_button_test.dart
│  ├─ news_card_test.dart
│  └─ disaster_alert_test.dart
```

### 11.3 Integration Tests

```
integration_test/
└─ app_test.dart
   ├─ Test: Beranda loads hero & berita
   ├─ Test: Submit pengaduan end-to-end
   ├─ Test: Cek status pengaduan
   └─ Test: Realtime bencana stream updates
```

**Run:**
```bash
flutter test
flutter test integration_test/app_test.dart
```

---

## 12. Build & Deployment

### 12.1 Build Configurations

**Environment Files:**
```
.env.dev
.env.prod
```

**Variables:**
```
SUPABASE_URL=https://xxx.supabase.co
SUPABASE_ANON_KEY=eyJxxx
FCM_SENDER_ID=123456789
```

**Load via `flutter_dotenv`:**
```dart
await dotenv.load(fileName: ".env.${env}");
final supabaseUrl = dotenv.env['SUPABASE_URL']!;
```

### 12.2 Build Commands

**Android APK (Release):**
```bash
flutter build apk --release --obfuscate --split-debug-info=build/debug-info
```

**Android App Bundle (Play Store):**
```bash
flutter build appbundle --release --obfuscate --split-debug-info=build/debug-info
```

**iOS (App Store):**
```bash
flutter build ios --release
# Open Xcode → Archive → Upload to App Store Connect
```

### 12.3 App Signing

**Android:**
- Generate keystore: `keytool -genkey -v -keystore portal-grobogan.jks`
- Configure `android/key.properties`
- Update `android/app/build.gradle` with signing config

**iOS:**
- Configure signing in Xcode
- Use Apple Developer Account

### 12.4 Version Management

**pubspec.yaml:**
```yaml
version: 1.0.0+1
# Format: MAJOR.MINOR.PATCH+BUILD_NUMBER
```

**Update strategy:**
- Patch: Bug fixes (1.0.1)
- Minor: New features (1.1.0)
- Major: Breaking changes (2.0.0)

---

## 13. Analytics & Monitoring

### 13.1 Firebase Analytics

**Track Events:**
- Screen views (auto)
- Button taps (`event: 'button_tap', params: {button_id: 'submit_pengaduan'}`)
- Form submissions
- Notification opens
- Search queries

### 13.2 Crashlytics

```dart
await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

// Log custom errors
try {
  await submitPengaduan();
} catch (e, stack) {
  FirebaseCrashlytics.instance.recordError(e, stack);
  rethrow;
}
```

### 13.3 Performance Monitoring

```dart
final trace = FirebasePerformance.instance.newTrace('fetch_berita');
await trace.start();
// ... fetch operation
await trace.stop();
```

---

## 14. Accessibility

### 14.1 Semantic Labels

```dart
IconButton(
  icon: Icon(Icons.search),
  onPressed: onSearch,
  tooltip: 'Cari berita',
  semanticsLabel: 'Tombol cari berita',
);
```

### 14.2 Text Scaling

Support dynamic text scaling:
```dart
Text(
  'Judul',
  style: Theme.of(context).textTheme.headlineMedium,
  // Automatically scales with system font size
);
```

### 14.3 Color Contrast

Ensure WCAG AA compliance:
- Electric Blue (#0066FF) on white: **7.5:1** ✓
- Gray500 (#6B7280) on white: **4.6:1** ✓
- White on Electric Blue: **7.5:1** ✓

### 14.4 Screen Reader Support

- Set `Semantics` widgets for custom components
- Use Material widgets (built-in semantics)
- Test with TalkBack (Android) & VoiceOver (iOS)

---

## 15. Security

### 15.1 Supabase RLS

- Rely on Row Level Security policies defined in backend
- Use `anon key` for public data (berita, layanan)
- Never expose `service_role key` in mobile app

### 15.2 API Key Protection

- Store in `.env` (not committed to git)
- Obfuscate code on release build
- Use `--split-debug-info` to remove symbols

### 15.3 File Upload Validation

```dart
// Client-side check before upload
if (file.lengthSync() > 10 * 1024 * 1024) {
  throw Exception('File terlalu besar (max 10MB)');
}

final allowedExtensions = ['jpg', 'jpeg', 'png', 'pdf'];
final ext = path.extension(file.path).toLowerCase().substring(1);
if (!allowedExtensions.contains(ext)) {
  throw Exception('Format file tidak didukung');
}
```

---

## 16. Localization (Future)

**Current:** Bahasa Indonesia only

**Future Enhancement:**
```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: ^0.18.0
```

Support:
- Bahasa Indonesia (default)
- English (optional for tourists)

---

## 17. Timeline & Milestones

| Fase | Durasi | Deliverable |
|------|--------|-------------|
| **Week 1-2** | Setup & Design System | Theme, colors, components, providers setup |
| **Week 3** | Core Screens (Part 1) | Beranda, Layanan, Berita screens |
| **Week 4** | Core Screens (Part 2) | Pengaduan form, Cek status, Detail screens |
| **Week 5** | Realtime & Push | Bencana realtime, FCM integration, notifications |
| **Week 6** | Polish & UX | Animations, micro-interactions, offline support |
| **Week 7** | Testing | Unit, widget, integration tests |
| **Week 8** | Build & Deploy | Release builds, Play Store submission, QA |

**Total:** 8 weeks (sesuai timeline global PRD)

---

## 18. Success Metrics

### 18.1 Performance KPIs

- App launch time: < 2 seconds (cold start)
- Screen transition: < 250ms
- Image load time: < 1 second (cached)
- Crash-free rate: > 99.5%

### 18.2 User Engagement

- Daily Active Users (DAU)
- Pengaduan submission rate
- Berita article read rate
- Push notification open rate > 40%

### 18.3 Technical Metrics

- Code coverage: > 80%
- Build success rate: > 95%
- Play Store rating target: > 4.3 ★

---

## 19. Risks & Mitigation

| Risk | Impact | Mitigation |
|------|--------|------------|
| Supabase downtime | High | Implement local cache, retry logic |
| Push notification delivery failure | Medium | Use Supabase Realtime as fallback |
| Large file upload timeout | Medium | Compress images client-side, chunk upload |
| Rapid Flutter version changes | Low | Pin dependencies, test before upgrade |

---

## 20. Future Enhancements (Post-MVP)

- [ ] User accounts & profiles (login warga)
- [ ] Pengaduan tracking via push (auto-subscribe by ID)
- [ ] Dark mode toggle
- [ ] Bookmark berita
- [ ] Share pengaduan ke social media
- [ ] Offline mode penuh (sync saat online kembali)
- [ ] Voice input untuk pengaduan
- [ ] Chatbot bantuan (AI-powered)
- [ ] Pariwisata AR tour (experimental)

---

**Document Version:** 1.0.0  
**Last Updated:** April 2026  
**Status:** Ready for Development  
**Next Review:** Post-MVP Launch
