# Mobile Task List — Portal Grobogan Flutter
**Design:** Electric Blue · Minimalist-Modern · Calistoga + Inter  
**Status:** Development Ready

---

## 📱 FASE 1 — Project Setup & Dependencies

### 1.1 Initialize Flutter Project
- [ ] Run: `flutter create portal_grobogan --org id.grobogan.portal`
- [x] Set minimum SDK versions:
  ```yaml
  environment:
    sdk: '>=3.0.0 <4.0.0'
  ```
- [ ] Update `android/app/build.gradle`:
  ```gradle
  minSdkVersion 21
  targetSdkVersion 34
  ```
- [ ] Update iOS deployment target (iOS 12.0) di `ios/Podfile`

### 1.2 Install Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_riverpod: ^2.4.0
  riverpod_annotation: ^2.3.0
  
  # Routing
  go_router: ^12.0.0
  
  # Supabase
  supabase_flutter: ^2.0.0
  
  # Firebase (Push Notifications)
  firebase_core: ^2.24.0
  firebase_messaging: ^14.7.0
  firebase_analytics: ^10.7.0
  firebase_crashlytics: ^3.4.0
  
  # UI Components
  cached_network_image: ^3.3.0
  flutter_svg: ^2.0.9
  shimmer: ^3.0.0
  lottie: ^2.7.0
  
  # Utilities
  intl: ^0.18.1
  uuid: ^4.2.0
  path: ^1.8.3
  image_picker: ^1.0.5
  file_picker: ^6.1.1
  url_launcher: ^6.2.1
  share_plus: ^7.2.1
  
  # Fonts
  google_fonts: ^6.1.0
  
  # Environment
  flutter_dotenv: ^5.1.0
  
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  build_runner: ^2.4.6
  riverpod_generator: ^2.3.0
```

- [ ] Run: `flutter pub get`

### 1.3 Firebase Setup

**Android:**
- [x] Buat project di [Firebase Console](https://console.firebase.google.com)
- [x] Register Android app: `id.grobogan.portal`
- [ ] Download `google-services.json` → `android/app/`
- [ ] Update `android/build.gradle`:
  ```gradle
  dependencies {
    classpath 'com.google.gms:google-services:4.4.0'
  }
  ```
- [ ] Update `android/app/build.gradle`:
  ```gradle
  apply plugin: 'com.google.gms.google-services'
  ```

**iOS:**
- [x] Register iOS app di Firebase Console
- [ ] Download `GoogleService-Info.plist` → `ios/Runner/`
- [x] Open Xcode, tambahkan file ke Runner target
- [x] Enable Push Notifications capability di Xcode

### 1.4 Environment Configuration
- [ ] Buat file `.env` di root project:
  ```
  SUPABASE_URL=https://xxx.supabase.co
  SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
  ```
- [ ] Tambahkan `.env` ke `.gitignore`
- [ ] Buat `.env.example` sebagai template
- [ ] Load env di `main.dart`:
  ```dart
  await dotenv.load(fileName: ".env");
  ```

### 1.5 Project Structure
```
lib/
├── main.dart
├── app.dart
├── config/
│   ├── app_config.dart
│   └── supabase_config.dart
├── theme/
│   ├── app_colors.dart
│   ├── app_text_styles.dart
│   ├── app_theme.dart
│   └── app_dimensions.dart
├── models/
│   ├── berita.dart
│   ├── layanan.dart
│   ├── pengaduan.dart
│   ├── bencana.dart
│   ├── hero_slide.dart
│   └── pariwisata.dart
├── services/
│   ├── supabase_service.dart
│   ├── berita_service.dart
│   ├── layanan_service.dart
│   ├── pengaduan_service.dart
│   ├── bencana_service.dart
│   └── pariwisata_service.dart
├── providers/
│   ├── berita_provider.dart
│   ├── layanan_provider.dart
│   ├── pengaduan_provider.dart
│   ├── bencana_provider.dart
│   └── hero_slides_provider.dart
├── widgets/
│   ├── app_card.dart
│   ├── app_button.dart
│   ├── app_badge.dart
│   ├── app_bottom_nav.dart
│   ├── news_card.dart
│   ├── service_card.dart
│   ├── disaster_alert.dart
│   ├── hero_carousel.dart
│   ├── skeleton_loader.dart
│   └── empty_state.dart
├── screens/
│   ├── beranda/
│   │   └── beranda_screen.dart
│   ├── layanan/
│   │   ├── layanan_screen.dart
│   │   ├── layanan_detail_screen.dart
│   │   └── kebencanaan_screen.dart
│   ├── pengaduan/
│   │   ├── pengaduan_screen.dart
│   │   ├── pengaduan_sukses_screen.dart
│   │   └── pengaduan_cek_screen.dart
│   ├── berita/
│   │   ├── berita_screen.dart
│   │   └── berita_detail_screen.dart
│   ├── pariwisata/
│   │   └── pariwisata_screen.dart
│   └── profil/
│       └── profil_screen.dart
└── utils/
    ├── constants.dart
    ├── helpers.dart
    └── validators.dart
```

- [x] Buat semua folder struktur di atas

---

## 🎨 FASE 2 — Design System Implementation

### 2.1 Color Constants (`lib/theme/app_colors.dart`)

```dart
class AppColors {
  // Primary - Electric Blue System
  static const Color electricBlue = Color(0xFF0066FF);
  static const Color electricBlueDark = Color(0xFF0052CC);
  static const Color electricBlueLight = Color(0xFF3385FF);
  
  // Gradients
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF0066FF), Color(0xFF00A3FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const Gradient heroGradient = LinearGradient(
    colors: [Color(0x00000000), Color(0x99000000)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  
  // Inverted Sections
  static const Color charcoal = Color(0xFF1A1D29);
  static const Color charcoalLight = Color(0xFF2D3142);
  
  // Neutrals
  static const Color white = Color(0xFFFFFFFF);
  static const Color offWhite = Color(0xFFF8F9FA);
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray900 = Color(0xFF111827);
  
  // Semantic
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  
  // Accent
  static const Color accentGold = Color(0xFFFFB800);
}
```

- [ ] Buat file `app_colors.dart`
- [x] Define semua konstanta warna

### 2.2 Text Styles (`lib/theme/app_text_styles.dart`)

```dart
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Display/Headings - Calistoga
  static TextStyle displayLarge = GoogleFonts.calistoga(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.charcoal,
  );
  
  static TextStyle displayMedium = GoogleFonts.calistoga(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.3,
    color: AppColors.charcoal,
  );
  
  static TextStyle headingLarge = GoogleFonts.calistoga(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.charcoal,
  );
  
  // Body - Inter
  static TextStyle bodyLarge = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
    color: AppColors.gray900,
  );
  
  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.gray900,
  );
  
  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.gray500,
  );
  
  // Labels
  static TextStyle labelMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    color: AppColors.gray900,
  );
  
  static TextStyle buttonText = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    color: AppColors.white,
  );
}
```

- [ ] Buat file `app_text_styles.dart`
- [x] Install Google Fonts: Calistoga + Inter

### 2.3 App Theme (`lib/theme/app_theme.dart`)

```dart
class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    
    colorScheme: ColorScheme.light(
      primary: AppColors.electricBlue,
      onPrimary: AppColors.white,
      secondary: AppColors.accentGold,
      surface: AppColors.white,
      background: AppColors.offWhite,
      error: AppColors.danger,
    ),
    
    scaffoldBackgroundColor: AppColors.offWhite,
    
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.headingLarge,
      iconTheme: IconThemeData(color: AppColors.charcoal),
    ),
    
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.electricBlue,
      unselectedItemColor: AppColors.gray500,
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    
    cardTheme: CardTheme(
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.gray200, width: 1),
      ),
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.gray200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.gray200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.electricBlue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.danger),
      ),
    ),
  );
}
```

- [ ] Buat file `app_theme.dart`
- [x] Define ThemeData lengkap

### 2.4 Dimensions & Spacing (`lib/theme/app_dimensions.dart`)

```dart
class AppDimensions {
  // Spacing (8px grid)
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing48 = 48.0;
  static const double spacing64 = 64.0;
  
  // Padding
  static const EdgeInsets screenPadding = EdgeInsets.all(20.0);
  static const EdgeInsets cardPadding = EdgeInsets.all(16.0);
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: 24.0,
    vertical: 12.0,
  );
  
  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusXL = 24.0;
  static const double radiusFull = 9999.0;
  
  // Shadows
  static const List<BoxShadow> shadowSmall = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
  ];
  
  static const List<BoxShadow> shadowMedium = [
    BoxShadow(
      color: Color(0x14000000),
      offset: Offset(0, 4),
      blurRadius: 12,
    ),
  ];
  
  static const List<BoxShadow> shadowBlue = [
    BoxShadow(
      color: Color(0x330066FF),
      offset: Offset(0, 4),
      blurRadius: 16,
    ),
  ];
}
```

- [ ] Buat file `app_dimensions.dart`

---

## 🧩 FASE 3 — Reusable Widgets

### 3.1 AppCard Widget

```dart
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final bool elevated;
  final bool dark;
  
  const AppCard({
    required this.child,
    this.padding,
    this.onTap,
    this.elevated = false,
    this.dark = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: dark ? AppColors.charcoalLight : AppColors.white,
      borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
      elevation: elevated ? 2 : 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
        child: Container(
          padding: padding ?? AppDimensions.cardPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            border: elevated ? null : Border.all(
              color: dark ? AppColors.gray500.withOpacity(0.3) : AppColors.gray200,
            ),
            boxShadow: elevated ? AppDimensions.shadowMedium : null,
          ),
          child: child,
        ),
      ),
    );
  }
}
```

- [ ] Buat `lib/widgets/app_card.dart`
- [x] Implement variants: default, elevated, dark

### 3.2 AppButton Widget

```dart
enum AppButtonVariant { primary, secondary, ghost, danger }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final IconData? icon;
  
  const AppButton({
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.icon,
  });
  
  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: onPressed != null ? 1.0 : 0.98,
      duration: AppDurations.fast,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          gradient: variant == AppButtonVariant.primary 
            ? AppColors.primaryGradient 
            : null,
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
          boxShadow: variant == AppButtonVariant.primary 
            ? AppDimensions.shadowBlue 
            : null,
          border: variant == AppButtonVariant.secondary
            ? Border.all(color: AppColors.electricBlue, width: 2)
            : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMedium),
            child: Center(
              child: isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(_getTextColor()),
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (icon != null) ...[
                        Icon(icon, color: _getTextColor(), size: 20),
                        SizedBox(width: 8),
                      ],
                      Text(label, style: _getTextStyle()),
                    ],
                  ),
            ),
          ),
        ),
      ),
    );
  }
  
  Color _getBackgroundColor() {
    switch (variant) {
      case AppButtonVariant.secondary:
        return AppColors.white;
      case AppButtonVariant.ghost:
        return Colors.transparent;
      case AppButtonVariant.danger:
        return AppColors.danger;
      default:
        return Colors.transparent;
    }
  }
  
  Color _getTextColor() {
    return variant == AppButtonVariant.secondary 
      ? AppColors.electricBlue 
      : AppColors.white;
  }
  
  TextStyle _getTextStyle() {
    return AppTextStyles.buttonText.copyWith(color: _getTextColor());
  }
}
```

- [ ] Buat `lib/widgets/app_button.dart`
- [x] Implement 4 variants + loading state

### 3.3 AppBadge Widget

```dart
class AppBadge extends StatelessWidget {
  final String label;
  final Color color;
  
  const AppBadge({required this.label, required this.color});
  
  factory AppBadge.berita() => AppBadge(
    label: 'Berita',
    color: AppColors.electricBlue,
  );
  
  factory AppBadge.pengumuman() => AppBadge(
    label: 'Pengumuman',
    color: AppColors.accentGold,
  );
  
  factory AppBadge.status(String status) {
    Color color;
    switch (status.toLowerCase()) {
      case 'diterima':
        color = AppColors.gray500;
        break;
      case 'proses':
        color = AppColors.info;
        break;
      case 'selesai':
        color = AppColors.success;
        break;
      default:
        color = AppColors.gray500;
    }
    return AppBadge(label: status, color: color);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusFull),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
```

- [ ] Buat `lib/widgets/app_badge.dart`
- [x] Factory constructors untuk variants

### 3.4 SkeletonLoader Widget

```dart
class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  
  const SkeletonLoader({
    required this.width,
    required this.height,
    this.borderRadius,
  });
  
  factory SkeletonLoader.card() => SkeletonLoader(
    width: double.infinity,
    height: 200,
    borderRadius: BorderRadius.circular(12),
  );
  
  factory SkeletonLoader.text() => SkeletonLoader(
    width: double.infinity,
    height: 16,
    borderRadius: BorderRadius.circular(4),
  );
  
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray200,
      highlightColor: AppColors.gray100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.gray200,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}
```

- [ ] Buat `lib/widgets/skeleton_loader.dart`
- [ ] Install `shimmer` package

### 3.5 EmptyState Widget

```dart
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onRetry;
  
  const EmptyState({
    required this.icon,
    required this.title,
    required this.description,
    this.onRetry,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: AppColors.gray500),
            SizedBox(height: 16),
            Text(title, style: AppTextStyles.headingLarge),
            SizedBox(height: 8),
            Text(
              description,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.gray500,
              ),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              SizedBox(height: 24),
              AppButton(
                label: 'Muat Ulang',
                variant: AppButtonVariant.secondary,
                onPressed: onRetry,
                icon: Icons.refresh,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
```

- [ ] Buat `lib/widgets/empty_state.dart`

### 3.6 NewsCard Widget

```dart
class NewsCard extends StatelessWidget {
  final Berita berita;
  final VoidCallback? onTap;
  
  const NewsCard({required this.berita, this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppDimensions.radiusMedium),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: berita.thumbnailUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => SkeletonLoader.card(),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.gray100,
                  child: Icon(Icons.broken_image, color: AppColors.gray500),
                ),
              ),
            ),
          ),
          
          // Content
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBadge.berita(),
                SizedBox(height: 8),
                Text(
                  berita.judul,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 14, color: AppColors.gray500),
                    SizedBox(width: 4),
                    Text(
                      _formatDate(berita.createdAt),
                      style: AppTextStyles.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy', 'id_ID').format(date);
  }
}
```

- [ ] Buat `lib/widgets/news_card.dart`
- [ ] Install `intl` package untuk date formatting

### 3.7 ServiceCard Widget

- [ ] Buat `lib/widgets/service_card.dart`
- [ ] Square card dengan icon + label

### 3.8 DisasterAlert Widget

- [ ] Buat `lib/widgets/disaster_alert.dart`
- [ ] Color-coded border left (red/amber/green)
- [ ] Pulse animation untuk BAHAYA level

### 3.9 HeroCarousel Widget

- [ ] Buat `lib/widgets/hero_carousel.dart`
- [ ] Menggunakan `carousel_slider` package
- [ ] Auto-play 5 detik
- [ ] Dot indicator Electric Blue

---

## 🔧 FASE 4 — Data Layer (Models & Services)

### 4.1 Models

**Berita Model:**
```dart
class Berita {
  final String id;
  final String judul;
  final String slug;
  final String konten;
  final String thumbnailUrl;
  final String kategori;
  final String status;
  final DateTime createdAt;
  
  Berita({...});
  
  factory Berita.fromJson(Map<String, dynamic> json) {
    return Berita(
      id: json['id'],
      judul: json['judul'],
      slug: json['slug'],
      konten: json['konten'],
      thumbnailUrl: json['thumbnail_url'] ?? '',
      kategori: json['kategori'] ?? 'Umum',
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
```

- [ ] Buat `lib/models/berita.dart`
- [ ] Buat `lib/models/layanan.dart`
- [ ] Buat `lib/models/pengaduan.dart`
- [ ] Buat `lib/models/bencana.dart`
- [ ] Buat `lib/models/hero_slide.dart`
- [ ] Buat `lib/models/pariwisata.dart`
- [ ] Semua dengan `fromJson` factory

### 4.2 Supabase Service (Singleton)

```dart
class SupabaseService {
  static SupabaseService? _instance;
  late final SupabaseClient client;
  
  SupabaseService._internal();
  
  static Future<SupabaseService> getInstance() async {
    if (_instance == null) {
      _instance = SupabaseService._internal();
      await _instance!._initialize();
    }
    return _instance!;
  }
  
  Future<void> _initialize() async {
    await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    );
    client = Supabase.instance.client;
  }
}
```

- [ ] Buat `lib/services/supabase_service.dart`
- [ ] Initialize di `main.dart`

### 4.3 BeritaService

```dart
class BeritaService {
  final SupabaseClient _client;
  
  BeritaService(this._client);
  
  Future<List<Berita>> getBeritaTerbaru({int limit = 10}) async {
    final response = await _client
      .from('berita')
      .select()
      .eq('status', 'published')
      .order('created_at', ascending: false)
      .limit(limit);
    
    return (response as List)
      .map((json) => Berita.fromJson(json))
      .toList();
  }
  
  Future<Berita?> getBeritaBySlug(String slug) async {
    final response = await _client
      .from('berita')
      .select()
      .eq('slug', slug)
      .maybeSingle();
    
    return response != null ? Berita.fromJson(response) : null;
  }
}
```

- [ ] Buat `lib/services/berita_service.dart`
- [ ] Methods: `getBeritaTerbaru`, `getBeritaBySlug`, `searchBerita`

### 4.4 LayananService

- [ ] Buat `lib/services/layanan_service.dart`
- [ ] Method: `getAllLayanan`

### 4.5 PengaduanService

```dart
class PengaduanService {
  final SupabaseClient _client;
  
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
      await _client.storage
        .from('pengaduan-lampiran')
        .upload(fileName, lampiran);
      
      lampiranUrl = _client.storage
        .from('pengaduan-lampiran')
        .getPublicUrl(fileName);
    }
    
    // 2. Insert ke database
    final response = await _client
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
    final response = await _client
      .from('pengaduan')
      .select()
      .eq('id', id)
      .maybeSingle();
    
    return response != null ? Pengaduan.fromJson(response) : null;
  }
}
```

- [ ] Buat `lib/services/pengaduan_service.dart`

### 4.6 BencanaService (Realtime Stream)

```dart
class BencanaService {
  final SupabaseClient _client;
  
  Stream<List<Bencana>> getBencanaStream() {
    return _client
      .from('bencana')
      .stream(primaryKey: ['id'])
      .eq('aktif', true)
      .order('created_at', ascending: false)
      .map((data) => data.map((json) => Bencana.fromJson(json)).toList());
  }
}
```

- [ ] Buat `lib/services/bencana_service.dart`

### 4.7 PariwisataService

- [ ] Buat `lib/services/pariwisata_service.dart`
- [ ] Method: `getAllDestinasi`

---

## 📦 FASE 5 — State Management (Riverpod Providers)

### 5.1 Setup Riverpod Generator

- [ ] Install `riverpod_generator`, `riverpod_annotation`, `build_runner`
- [ ] Run: `flutter pub run build_runner build --delete-conflicting-outputs`

### 5.2 Service Providers

```dart
@riverpod
BeritaService beritaService(BeritaServiceRef ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return BeritaService(supabase);
}
```

- [x] Buat provider untuk semua services di `lib/providers/`

### 5.3 Data Providers

**BeritaProvider:**
```dart
@riverpod
Future<List<Berita>> beritaTerbaru(BeritaTerbaruRef ref) async {
  final service = ref.watch(beritaServiceProvider);
  return service.getBeritaTerbaru(limit: 5);
}

@riverpod
class BeritaList extends _$BeritaList {
  @override
  FutureOr<List<Berita>> build() async {
    final service = ref.watch(beritaServiceProvider);
    return service.getBeritaTerbaru(limit: 10);
  }
  
  Future<void> loadMore() async {
    // Pagination logic
  }
}
```

- [ ] Buat `lib/providers/berita_provider.dart`
- [ ] Buat `lib/providers/layanan_provider.dart`
- [ ] Buat `lib/providers/hero_slides_provider.dart`

**BencanaProvider (Stream):**
```dart
@riverpod
Stream<List<Bencana>> bencanaStream(BencanaStreamRef ref) {
  final service = ref.watch(bencanaServiceProvider);
  return service.getBencanaStream();
}
```

- [ ] Buat `lib/providers/bencana_provider.dart`

### 5.4 Form State Provider (Pengaduan)

```dart
@riverpod
class PengaduanForm extends _$PengaduanForm {
  @override
  PengaduanFormState build() {
    return PengaduanFormState.initial();
  }
  
  void updateNama(String value) {
    state = state.copyWith(nama: value);
  }
  
  // ... other setters
  
  Future<String> submit() async {
    state = state.copyWith(isLoading: true);
    
    try {
      final service = ref.read(pengaduanServiceProvider);
      final id = await service.submitPengaduan(
        nama: state.nama,
        email: state.email,
        // ... other fields
      );
      
      return id;
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
      rethrow;
    }
  }
}
```

- [ ] Buat `lib/providers/pengaduan_provider.dart`

---

## 📱 FASE 6 — Navigation & Routing (Go Router)

### 6.1 Router Configuration

```dart
final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithBottomNav(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => NoTransitionPage(
              child: BerandaScreen(),
            ),
          ),
          GoRoute(path: '/layanan', pageBuilder: ...),
          GoRoute(path: '/pengaduan', pageBuilder: ...),
          GoRoute(path: '/berita', pageBuilder: ...),
          GoRoute(path: '/profil', pageBuilder: ...),
        ],
      ),
      
      // Detail routes (outside shell)
      GoRoute(
        path: '/berita/:slug',
        pageBuilder: (context, state) {
          final slug = state.pathParameters['slug']!;
          return MaterialPage(child: BeritaDetailScreen(slug: slug));
        },
      ),
      
      GoRoute(path: '/layanan/:id', ...),
      GoRoute(path: '/pengaduan/sukses/:id', ...),
      GoRoute(path: '/pengaduan/cek', ...),
      GoRoute(path: '/pariwisata', ...),
    ],
  );
});
```

- [ ] Buat `lib/config/router.dart`
- [x] Define semua routes dengan pathParameters

### 6.2 ScaffoldWithBottomNav Widget

```dart
class ScaffoldWithBottomNav extends StatefulWidget {
  final Widget child;
  
  const ScaffoldWithBottomNav({required this.child});
  
  @override
  State<ScaffoldWithBottomNav> createState() => _ScaffoldWithBottomNavState();
}

class _ScaffoldWithBottomNavState extends State<ScaffoldWithBottomNav> {
  int _currentIndex = 0;
  
  final List<BottomNavigationBarItem> _navItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home), label: 'Beranda'),
    BottomNavigationBarItem(icon: Icon(Icons.grid_view_outlined), activeIcon: Icon(Icons.grid_view), label: 'Layanan'),
    BottomNavigationBarItem(icon: Icon(Icons.description_outlined), activeIcon: Icon(Icons.description), label: 'Pengaduan'),
    BottomNavigationBarItem(icon: Icon(Icons.article_outlined), activeIcon: Icon(Icons.article), label: 'Berita'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profil'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          
          final routes = ['/', '/layanan', '/pengaduan', '/berita', '/profil'];
          context.go(routes[index]);
        },
        items: _navItems,
      ),
    );
  }
}
```

- [ ] Buat `lib/widgets/scaffold_with_bottom_nav.dart`

---

## 🖼️ FASE 7 — Screen Implementation

### 7.1 BerandaScreen

**Layout:**
- AppBar dengan gradient Electric Blue background
- Hero carousel (240px)
- Section "Layanan Unggulan" — grid 3 columns, 5 cards
- Section "Berita Terkini" — horizontal scroll
- Section "Pengumuman" — list 2 items
- Section "Kebencanaan" (conditional) — realtime alert cards
- FAB "Buat Pengaduan"

```dart
class BerandaScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heroSlides = ref.watch(heroSlidesProvider);
    final layanan = ref.watch(layananProvider);
    final berita = ref.watch(beritaTerbaruProvider);
    final bencana = ref.watch(bencanaStreamProvider);
    
    return Scaffold(
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(heroSlidesProvider);
          ref.invalidate(beritaTerbaruProvider);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              heroSlides.when(
                data: (slides) => HeroCarousel(slides: slides),
                loading: () => SkeletonLoader.card(),
                error: (e, _) => EmptyState(...),
              ),
              
              _buildLayananSection(layanan),
              _buildBeritaSection(berita),
              bencana.when(
                data: (alerts) => _buildBencanaSection(alerts),
                loading: () => SizedBox(),
                error: (e, _) => SizedBox(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/pengaduan'),
        label: Text('Buat Pengaduan'),
        icon: Icon(Icons.add),
        backgroundColor: AppColors.electricBlue,
      ),
    );
  }
}
```

- [ ] Buat `lib/screens/beranda/beranda_screen.dart`
- [ ] Implement semua sections

### 7.2 LayananScreen

- [ ] Buat `lib/screens/layanan/layanan_screen.dart`
- [ ] Grid 2 columns, search bar
- [ ] Filter dinamis

### 7.3 LayananDetailScreen (Kebencanaan)

- [ ] Buat `lib/screens/layanan/kebencanaan_screen.dart`
- [ ] Hero section inverted (dark background)
- [ ] Realtime stream `bencanaStreamProvider`
- [ ] List DisasterAlert cards dengan color-coding
- [ ] Empty state jika tidak ada alert
- [ ] Kontak darurat cards

### 7.4 PengaduanScreen (Form)

```dart
class PengaduanScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<PengaduanScreen> createState() => _PengaduanScreenState();
}

class _PengaduanScreenState extends ConsumerState<PengaduanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _emailController = TextEditingController();
  // ... other controllers
  
  File? _lampiran;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Buat Pengaduan')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: AppDimensions.screenPadding,
          children: [
            TextFormField(
              controller: _namaController,
              decoration: InputDecoration(labelText: 'Nama Pelapor *'),
              validator: (v) => v?.isEmpty ?? true ? 'Wajib diisi' : null,
            ),
            SizedBox(height: 16),
            
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email *'),
              validator: _validateEmail,
            ),
            SizedBox(height: 16),
            
            // ... other fields
            
            if (_lampiran != null) _buildLampiranPreview(),
            
            OutlinedButton.icon(
              onPressed: _pickFile,
              icon: Icon(Icons.attach_file),
              label: Text('Lampiran (Opsional)'),
            ),
            
            SizedBox(height: 32),
            
            AppButton(
              label: 'Kirim Pengaduan',
              onPressed: _submit,
              isLoading: ref.watch(pengaduanFormProvider).isLoading,
            ),
            
            SizedBox(height: 16),
            
            TextButton(
              onPressed: () => context.push('/pengaduan/cek'),
              child: Text('Cek Status Pengaduan'),
            ),
          ],
        ),
      ),
    );
  }
  
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    try {
      final id = await ref.read(pengaduanFormProvider.notifier).submit();
      
      HapticFeedback.mediumImpact();
      context.push('/pengaduan/sukses/$id');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengirim: $e')),
      );
    }
  }
}
```

- [ ] Buat `lib/screens/pengaduan/pengaduan_screen.dart`
- [ ] Validasi semua field
- [ ] File picker untuk lampiran
- [ ] Submit dengan loading state

### 7.5 PengaduanSuksesScreen

- [ ] Buat `lib/screens/pengaduan/pengaduan_sukses_screen.dart`
- [ ] Centered layout dengan icon success
- [ ] ID pengaduan dengan tombol copy
- [ ] Buttons: "Kembali ke Beranda", "Cek Status"

### 7.6 PengaduanCekScreen

- [ ] Buat `lib/screens/pengaduan/pengaduan_cek_screen.dart`
- [ ] Input ID + button "Cek Status"
- [ ] Tampilkan detail pengaduan dengan badge status
- [ ] Empty state jika ID tidak ditemukan

### 7.7 BeritaScreen (Tabs)

```dart
class BeritaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Berita & Pengumuman'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Berita'),
              Tab(text: 'Pengumuman'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BeritaTab(),
            PengumumanTab(),
          ],
        ),
      ),
    );
  }
}
```

- [ ] Buat `lib/screens/berita/berita_screen.dart`
- [ ] Tabs dengan Material TabBar
- [ ] Lazy load pagination di kedua tabs

### 7.8 BeritaDetailScreen

```dart
class BeritaDetailScreen extends ConsumerWidget {
  final String slug;
  
  const BeritaDetailScreen({required this.slug});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final berita = ref.watch(beritaDetailProvider(slug));
    
    return berita.when(
      data: (data) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      imageUrl: data.thumbnailUrl,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.heroGradient,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            SliverToBoxAdapter(
              child: Transform.translate(
                offset: Offset(0, -20),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBadge.berita(),
                      SizedBox(height: 12),
                      Text(data.judul, style: AppTextStyles.displayMedium),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 14),
                          SizedBox(width: 4),
                          Text(_formatDate(data.createdAt)),
                        ],
                      ),
                      Divider(height: 32),
                      Html(data: data.konten),
                      SizedBox(height: 24),
                      OutlinedButton.icon(
                        onPressed: () => _share(data),
                        icon: Icon(Icons.share),
                        label: Text('Bagikan'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      loading: () => Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        body: EmptyState(
          icon: Icons.error_outline,
          title: 'Berita tidak ditemukan',
          description: 'Berita yang Anda cari tidak tersedia',
        ),
      ),
    );
  }
}
```

- [ ] Buat `lib/screens/berita/berita_detail_screen.dart`
- [ ] SliverAppBar dengan parallax image
- [ ] Rounded top content card
- [ ] Render HTML dengan `flutter_html`
- [ ] Share button

### 7.9 PariwisataScreen

- [ ] Buat `lib/screens/pariwisata/pariwisata_screen.dart`
- [ ] Hero section gradient Electric Blue
- [ ] Grid 2 columns destinasi
- [ ] DestinasiCard dengan image + nama + alamat

### 7.10 ProfilScreen

- [ ] Buat `lib/screens/profil/profil_screen.dart`
- [ ] Static content: logo, sejarah, visi-misi, kontak
- [ ] App version + build number di footer
- [ ] Links: Ketentuan Layanan, Kebijakan Privasi

---

## 🔔 FASE 8 — Push Notifications (Firebase Messaging)

### 8.1 FCM Initialization

```dart
// lib/services/notification_service.dart
class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  
  Future<void> initialize() async {
    // Request permission
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      
      // Get FCM token
      String? token = await _messaging.getToken();
      print('FCM Token: $token');
      
      // Subscribe to topics
      await _messaging.subscribeToTopic('semua-warga');
      
      // Setup handlers
      _setupHandlers();
    }
  }
  
  void _setupHandlers() {
    // Foreground
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    
    // Background/Terminated tap
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
    
    // App launched via notification
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) _handleNotificationTap(message);
    });
  }
  
  void _handleForegroundMessage(RemoteMessage message) {
    // Show in-app notification
    Get.snackbar(
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      duration: Duration(seconds: 3),
    );
  }
  
  void _handleNotificationTap(RemoteMessage message) {
    final data = message.data;
    final type = data['type'];
    
    switch (type) {
      case 'bencana':
        Get.toNamed('/layanan/kebencanaan');
        break;
      case 'pengaduan':
        Get.toNamed('/pengaduan/cek', arguments: {'id': data['id']});
        break;
      case 'berita':
        Get.toNamed('/berita/${data['slug']}');
        break;
    }
  }
}
```

- [ ] Buat `lib/services/notification_service.dart`
- [ ] Initialize di `main.dart`

### 8.2 Notification Permission Screen (Optional)

- [ ] Buat onboarding screen dengan request permission
- [ ] List benefits: bencana darurat, update pengaduan, berita

---

## 🧪 FASE 9 — Testing

### 9.1 Unit Tests

```dart
// test/models/berita_test.dart
void main() {
  group('Berita Model', () {
    test('fromJson should parse correctly', () {
      final json = {
        'id': '123',
        'judul': 'Test Berita',
        'slug': 'test-berita',
        'konten': 'Konten test',
        'thumbnail_url': 'https://example.com/image.jpg',
        'kategori': 'Umum',
        'status': 'published',
        'created_at': '2026-04-17T10:00:00Z',
      };
      
      final berita = Berita.fromJson(json);
      
      expect(berita.id, '123');
      expect(berita.judul, 'Test Berita');
      expect(berita.slug, 'test-berita');
    });
  });
}
```

- [ ] Test semua models (`fromJson`)
- [ ] Test validators (`lib/utils/validators.dart`)

### 9.2 Widget Tests

```dart
// test/widgets/app_button_test.dart
void main() {
  testWidgets('AppButton renders correctly', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton(
            label: 'Test Button',
            onPressed: () {},
          ),
        ),
      ),
    );
    
    expect(find.text('Test Button'), findsOneWidget);
    expect(find.byType(AppButton), findsOneWidget);
  });
  
  testWidgets('AppButton shows loading state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppButton(
            label: 'Loading',
            isLoading: true,
          ),
        ),
      ),
    );
    
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
```

- [ ] Test AppButton (semua variants)
- [ ] Test AppCard
- [ ] Test AppBadge
- [ ] Test NewsCard

### 9.3 Integration Tests

```dart
// integration_test/app_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets('Submit pengaduan flow', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    
    // Navigate to Pengaduan screen
    await tester.tap(find.text('Pengaduan'));
    await tester.pumpAndSettle();
    
    // Fill form
    await tester.enterText(find.byKey(Key('nama_field')), 'Test User');
    await tester.enterText(find.byKey(Key('email_field')), 'test@example.com');
    // ... fill other fields
    
    // Submit
    await tester.tap(find.text('Kirim Pengaduan'));
    await tester.pumpAndSettle();
    
    // Verify success screen
    expect(find.text('Pengaduan Terkirim!'), findsOneWidget);
  });
}
```

- [ ] Test submit pengaduan end-to-end
- [ ] Test cek status pengaduan
- [ ] Test navigation flow

**Run Tests:**
```bash
flutter test
flutter test integration_test/app_test.dart
```

---

## 🚀 FASE 10 — Build & Deployment

### 10.1 Pre-Build Checklist

- [ ] Update `pubspec.yaml` version: `1.0.0+1`
- [ ] Update app icons (Android & iOS)
  ```bash
  flutter pub run flutter_launcher_icons
  ```
- [ ] Update splash screen
  ```bash
  flutter pub run flutter_native_splash:create
  ```
- [ ] Check environment variables (`.env` production)
- [ ] Disable debug logs di production:
  ```dart
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  ```

### 10.2 Build Android APK

```bash
flutter build apk --release --obfuscate --split-debug-info=build/debug-info
```

**Output:** `build/app/outputs/flutter-apk/app-release.apk`

### 10.3 Build Android App Bundle (Play Store)

```bash
flutter build appbundle --release --obfuscate --split-debug-info=build/debug-info
```

**Output:** `build/app/outputs/bundle/release/app-release.aab`

### 10.4 Setup App Signing (Android)

**Generate Keystore:**
```bash
keytool -genkey -v -keystore ~/portal-grobogan.jks -keyalg RSA -keysize 2048 -validity 10000 -alias portal
```

**Create `android/key.properties`:**
```
storePassword=your_store_password
keyPassword=your_key_password
keyAlias=portal
storeFile=/path/to/portal-grobogan.jks
```

**Update `android/app/build.gradle`:**
```gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

- [ ] Setup signing config
- [ ] Build signed AAB

### 10.5 Build iOS (App Store)

```bash
flutter build ios --release
```

- [ ] Open `ios/Runner.xcworkspace` di Xcode
- [ ] Select team & signing identity
- [ ] Archive → Upload to App Store Connect

### 10.6 Play Store Submission

**Prepare Assets:**
- [ ] App icon 512x512px
- [ ] Feature graphic 1024x500px
- [ ] Screenshots (phone, tablet, TV jika ada)
- [ ] Privacy policy URL
- [ ] Short description (80 char)
- [ ] Full description (4000 char)

**Upload:**
- [ ] Login ke [Google Play Console](https://play.google.com/console)
- [ ] Buat app baru "Portal Grobogan"
- [ ] Upload AAB ke Production/Internal Testing
- [ ] Fill store listing
- [ ] Submit for review

### 10.7 Monitoring & Analytics

**Firebase Crashlytics:**
```dart
FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

PlatformDispatcher.instance.onError = (error, stack) {
  FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  return true;
};
```

**Firebase Analytics:**
```dart
FirebaseAnalytics.instance.logEvent(
  name: 'pengaduan_submitted',
  parameters: {'kategori': kategori},
);
```

- [ ] Enable Crashlytics
- [ ] Enable Analytics
- [ ] Setup custom events

---

## ✅ Definition of Done

### Per Fase
- [ ] Semua task di fase selesai
- [ ] Code review passed
- [ ] Unit tests coverage > 80%
- [ ] No critical bugs
- [ ] Documentation updated

### MVP Launch Ready
- [ ] Semua 10 fase selesai
- [ ] Integration tests passed
- [ ] Performance metrics met (launch < 2s, transition < 250ms)
- [ ] Accessibility tested (contrast, screen reader)
- [ ] Tested di minimal 5 perangkat (Android + iOS)
- [ ] Play Store submission approved
- [ ] Crashlytics & Analytics configured
- [ ] User documentation ready

---

## 🎯 Success Metrics (Post-Launch)

- [ ] DAU (Daily Active Users) > 100 dalam minggu pertama
- [ ] Crash-free rate > 99.5%
- [ ] Average session duration > 3 minutes
- [ ] Pengaduan submission rate > 10/hari
- [ ] Play Store rating > 4.3★
- [ ] Push notification open rate > 40%

---

**Document Version:** 1.0.0  
**Last Updated:** April 2026  
**Estimated Timeline:** 8 weeks  
**Status:** Ready for Sprint Planning
