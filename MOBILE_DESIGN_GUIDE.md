# Mobile Design Guide — Portal Grobogan Flutter
**Visual Identity:** Electric Blue · Minimalist-Modern · Bold Typography  
**Philosophy:** Confidence Without Clutter

---

## 📐 Design Principles

### 1. Bold Minimalism
- **Generous Whitespace:** Breathing room antara elemen, minimum 16px gap
- **Content First:** UI elements menghilang, konten berbicara
- **One Action Per Screen:** Fokus tunggal, clear hierarchy

### 2. Electric Energy
- **Gradient Signatures:** Primary Electric Blue gradient untuk CTAs dan heroes
- **Micro-Animations:** Smooth transitions, haptic feedback, pulse effects
- **Dynamic Contrast:** Inverted sections (dark backgrounds) untuk rhythm

### 3. Typography as Interface
- **Calistoga Display:** Bold, playful, memorable — untuk headlines
- **Inter Body:** Clean, highly readable — untuk content
- **Size Jumps:** Dramatic scale differences (32px → 16px)

### 4. Color as Communication
- **Blue = Action:** Primary buttons, links, active states
- **Gold = Highlight:** Badges, special notices, accents
- **Red/Amber/Green = Status:** Semantic colors untuk feedback
- **Dark Sections = Depth:** Charcoal backgrounds untuk visual breaks

---

## 🎨 Color System

### Primary Palette

| Color Name | Hex | Usage | Contrast Ratio |
|------------|-----|-------|----------------|
| **Electric Blue** | `#0066FF` | Primary actions, links, active states | 7.5:1 on white |
| Electric Blue Dark | `#0052CC` | Hover/pressed states | 9.1:1 on white |
| Electric Blue Light | `#3385FF` | Tints, backgrounds | 4.8:1 on white |

**Gradient Signature:**
```dart
LinearGradient(
  colors: [Color(0xFF0066FF), Color(0xFF00A3FF)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)
```

**Usage:**
- Primary buttons
- FAB (Floating Action Button)
- Hero sections backgrounds
- Active tab indicators
- Links

### Inverted Palette

| Color Name | Hex | Usage |
|------------|-----|-------|
| **Charcoal** | `#1A1D29` | Dark section backgrounds |
| Charcoal Light | `#2D3142` | Cards on dark backgrounds |

**Usage:**
- Hero sections (alternate)
- Profil screen hero
- Feature callouts
- Footer sections

### Neutral Palette

| Color Name | Hex | Usage |
|------------|-----|-------|
| White | `#FFFFFF` | Card backgrounds, surfaces |
| Off-white | `#F8F9FA` | Screen backgrounds |
| Gray 50 | `#F9FAFB` | Subtle backgrounds |
| Gray 100 | `#F3F4F6` | Skeleton loaders |
| Gray 200 | `#E5E7EB` | Borders, dividers |
| Gray 500 | `#6B7280` | Secondary text, icons |
| Gray 900 | `#111827` | Primary text |

### Semantic Colors

| Color Name | Hex | Usage |
|------------|-----|-------|
| **Success** | `#10B981` | Status selesai, aman |
| **Warning** | `#F59E0B` | Status waspada |
| **Danger** | `#EF4444` | Status bahaya, errors |
| **Info** | `#3B82F6` | Status proses, informational |

### Accent Colors

| Color Name | Hex | Usage |
|------------|-----|-------|
| **Accent Gold** | `#FFB800` | Badges (pengumuman), highlights |

**Usage Guidelines:**
- Use sparingly (< 10% of screen)
- Pengumuman badges
- Special callouts
- Award/achievement indicators

---

## ✍️ Typography

### Font Pairing

**Display/Headings:** Calistoga (Google Fonts)  
**Body/UI:** Inter (Google Fonts)

**Why This Pairing?**
- **Contrast:** Bold playful display vs clean neutral body
- **Readability:** Inter optimized for screens, high x-height
- **Personality:** Calistoga adds character without sacrificing professionalism

### Type Scale

| Style | Font | Size | Weight | Line Height | Letter Spacing | Usage |
|-------|------|------|--------|-------------|----------------|-------|
| **Display Large** | Calistoga | 32px | 400 | 1.2 | -0.5px | Page titles, heroes |
| **Display Medium** | Calistoga | 24px | 400 | 1.3 | 0 | Section headings |
| **Heading Large** | Calistoga | 20px | 400 | 1.4 | 0 | Card titles, sub-sections |
| **Body Large** | Inter | 16px | 400 | 1.6 | 0 | Article content, descriptions |
| **Body Medium** | Inter | 14px | 400 | 1.5 | 0 | Standard body text |
| **Body Small** | Inter | 12px | 400 | 1.4 | 0 | Captions, metadata |
| **Label Medium** | Inter | 14px | 600 | 1.2 | 0.3px | Form labels, tags |
| **Button Text** | Inter | 15px | 600 | 1.0 | 0.2px | Button labels, CTAs |

### Text Color Guidelines

| Context | Color | Example |
|---------|-------|---------|
| Primary text | Gray 900 `#111827` | Article content, card titles |
| Secondary text | Gray 500 `#6B7280` | Metadata, captions |
| On dark backgrounds | White `#FFFFFF` | Hero text, inverted sections |
| Links | Electric Blue `#0066FF` | Inline links, "Lihat Selengkapnya" |
| Errors | Danger `#EF4444` | Validation messages |

### Responsive Type Scaling

**Mobile (320px - 599px):**
- Display Large: 28px
- Display Medium: 22px
- Body Large: 15px

**Tablet (600px+):**
- Use default scale

**Implementation:**
```dart
TextStyle.copyWith(
  fontSize: MediaQuery.of(context).size.width < 600 ? 28 : 32,
)
```

---

## 📏 Spacing System

### 8px Grid

All spacing values are multiples of 8:

| Token | Value | Usage |
|-------|-------|-------|
| `spacing4` | 4px | Icon-text gap, tight spacing |
| `spacing8` | 8px | Minimum gap between elements |
| `spacing12` | 12px | Card internal padding (compact) |
| `spacing16` | 16px | Default gap, card padding |
| `spacing20` | 20px | Screen horizontal padding |
| `spacing24` | 24px | Section spacing, card padding (comfortable) |
| `spacing32` | 32px | Section vertical spacing |
| `spacing48` | 48px | Large section breaks |
| `spacing64` | 64px | Hero padding, page spacing |

### Common Patterns

**Screen Padding:**
```dart
padding: EdgeInsets.all(20) // Standard screen padding
```

**Card Padding:**
```dart
padding: EdgeInsets.all(16) // Default card internal
padding: EdgeInsets.all(12) // Compact cards (grid items)
```

**List Item Spacing:**
```dart
SizedBox(height: 16) // Between list items
```

**Section Spacing:**
```dart
SizedBox(height: 32) // Between sections on screen
```

---

## 🔲 Border Radius

### Radius Scale

| Token | Value | Usage |
|-------|-------|-------|
| `radiusSmall` | 8px | Small buttons, badges |
| `radiusMedium` | 12px | Cards, inputs, standard buttons |
| `radiusLarge` | 16px | Modals, large cards |
| `radiusXL` | 24px | Hero images, feature cards |
| `radiusFull` | 9999px | Pills, badges, avatar placeholders |

### Component Radius Guide

| Component | Radius | Rationale |
|-----------|--------|-----------|
| AppCard | 12px | Balanced, not too round |
| AppButton | 12px | Consistent with cards |
| TextField | 12px | Unified form aesthetic |
| AppBadge | Full | Pill shape stands out |
| Hero Image | 24px (top only) | Soft, welcoming |
| Bottom Sheet | 24px (top only) | Drawer-like feel |

---

## 🌗 Shadows & Elevation

### Shadow Scale

**Small (Elevation 1):**
```dart
BoxShadow(
  color: Color(0x0A000000), // 4% black
  offset: Offset(0, 1),
  blurRadius: 3,
)
```
**Usage:** Default cards, inputs

**Medium (Elevation 2):**
```dart
BoxShadow(
  color: Color(0x14000000), // 8% black
  offset: Offset(0, 4),
  blurRadius: 12,
)
```
**Usage:** Hover cards, floating elements

**Large (Elevation 3):**
```dart
BoxShadow(
  color: Color(0x1F000000), // 12% black
  offset: Offset(0, 8),
  blurRadius: 24,
)
```
**Usage:** Modals, important overlays

**Blue Shadow (Primary Actions):**
```dart
BoxShadow(
  color: Color(0x330066FF), // 20% Electric Blue
  offset: Offset(0, 4),
  blurRadius: 16,
)
```
**Usage:** Primary buttons, FAB, active state CTAs

### Elevation Guidelines

- **Default State:** Small shadow (elevation 1)
- **Hover/Pressed:** Medium shadow (elevation 2)
- **Floating/Active:** Large shadow OR blue shadow
- **Dark Mode:** Reduce shadow intensity by 50%

---

## 🎬 Animations & Micro-Interactions

### Duration Standards

| Speed | Duration | Usage |
|-------|----------|-------|
| **Fast** | 150ms | Hover states, ripple effects |
| **Normal** | 250ms | Screen transitions, card animations |
| **Slow** | 400ms | Large movements, modals |

### Curve Standards

| Curve | Timing Function | Usage |
|-------|----------------|-------|
| **Default** | `Curves.easeInOut` | General transitions |
| **Snappy** | `Curves.easeOutCubic` | Button presses, taps |
| **Bounce** | `Curves.elasticOut` | Success animations, confirmations |

### Component-Specific Animations

#### 1. Button Press
```dart
AnimatedScale(
  scale: _isPressed ? 0.98 : 1.0,
  duration: Duration(milliseconds: 150),
  curve: Curves.easeOutCubic,
  child: buttonContent,
)
```

#### 2. Card Hover (Desktop/Tablet)
```dart
AnimatedContainer(
  duration: Duration(milliseconds: 250),
  decoration: BoxDecoration(
    boxShadow: _isHovered ? shadowMedium : shadowSmall,
  ),
)
```

#### 3. Page Transition
```dart
PageRouteBuilder(
  transitionDuration: Duration(milliseconds: 250),
  pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
      child: child,
    );
  },
)
```

#### 4. Hero Carousel
```dart
AnimatedSwitcher(
  duration: Duration(milliseconds: 400),
  transitionBuilder: (child, animation) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  },
  child: currentSlide,
)
```

#### 5. Disaster Alert Pulse (BAHAYA level)
```dart
AnimatedOpacity(
  opacity: _isPulsing ? 0.6 : 1.0,
  duration: Duration(milliseconds: 600),
  child: Container(
    decoration: BoxDecoration(
      border: Border(left: BorderSide(color: danger, width: 4)),
    ),
  ),
)

// Toggle _isPulsing every 600ms
Timer.periodic(Duration(milliseconds: 600), (timer) {
  setState(() => _isPulsing = !_isPulsing);
});
```

#### 6. Skeleton Shimmer
```dart
Shimmer.fromColors(
  baseColor: AppColors.gray200,
  highlightColor: AppColors.gray100,
  period: Duration(milliseconds: 1500),
  child: skeletonWidget,
)
```

### Haptic Feedback Guidelines

**When to Use:**
- **Light:** Button taps, minor interactions
- **Medium:** Form submissions, successful actions
- **Heavy:** Critical alerts, errors

**Implementation:**
```dart
// Light
HapticFeedback.lightImpact();

// Medium
HapticFeedback.mediumImpact();

// Heavy
HapticFeedback.heavyImpact();
```

**Don't Overuse:** Max 3-4 haptic events per user flow.

---

## 🧩 Component Specifications

### 1. AppCard

**Default Variant:**
```
┌─────────────────────────┐
│                         │
│  Card Content           │
│  (padding: 16px)        │
│                         │
└─────────────────────────┘
```
- Background: White `#FFFFFF`
- Border: 1px solid Gray 200 `#E5E7EB`
- Border Radius: 12px
- Shadow: Small (default state)
- Padding: 16px

**Elevated Variant:**
- No border
- Shadow: Medium
- Background: White

**Dark Variant:**
- Background: Charcoal Light `#2D3142`
- Border: 1px solid Gray 500 @ 30% opacity
- Text color: White

### 2. AppButton

**Primary Button (Gradient):**
```
┌─────────────────────────┐
│   [Gradient Background] │
│   Label Text (white)    │
│   Height: 48px          │
└─────────────────────────┘
```
- Background: Electric Blue gradient
- Text: White, Inter 15px semibold, letter-spacing 0.2px
- Shadow: Blue shadow
- Border Radius: 12px
- Padding: 24px horizontal, 12px vertical
- Min Width: 120px

**States:**
- Default: Opacity 1.0
- Pressed: Opacity 0.8, scale 0.98
- Disabled: Opacity 0.5, no pointer events

**Secondary Button (Outlined):**
- Background: White
- Border: 2px solid Electric Blue
- Text: Electric Blue
- Shadow: None (default), Small (hover)

**Ghost Button:**
- Background: Transparent
- Text: Electric Blue
- No border, no shadow

**Danger Button:**
- Background: Danger Red solid
- Text: White
- Shadow: Small

### 3. AppBadge

**Anatomy:**
```
┌──────────────┐
│  LABEL TEXT  │
└──────────────┘
```
- Background: Badge color @ 10% opacity
- Text: Badge color @ 100%, Inter 11px semibold, uppercase, letter-spacing 0.5px
- Border Radius: Full (9999px)
- Padding: 6px vertical, 12px horizontal
- Height: ~24px (auto)

**Variants:**
| Variant | Background | Text Color |
|---------|------------|------------|
| Berita | Blue @ 10% | Electric Blue |
| Pengumuman | Gold @ 10% | Accent Gold |
| Status Diterima | Gray @ 10% | Gray 500 |
| Status Proses | Info @ 10% | Info Blue |
| Status Selesai | Success @ 10% | Success Green |

### 4. NewsCard

**Vertical List Variant:**
```
┌────────────────────────────────┐
│ ┌──────────────┐               │
│ │  Thumbnail   │  Judul Berita │
│ │  120x90px    │  (3 lines max)│
│ └──────────────┘  Badge        │
│                   📅 14 Apr 26 │
└────────────────────────────────┘
```
- Container: AppCard
- Thumbnail: Aspect 4:3, CachedNetworkImage, border-radius top-left 12px
- Badge: Positioned absolute top-right of thumbnail
- Title: Body Large semibold, max 3 lines, ellipsis
- Meta: Body Small, Gray 500, icon + text

**Grid Variant (Berita Screen):**
```
┌─────────────────────┐
│  Thumbnail 16:9     │
├─────────────────────┤
│ Badge               │
│                     │
│ Judul (2 lines max) │
│                     │
│ 📅 Date • 👤 Author │
└─────────────────────┘
```
- Thumbnail: Aspect 16:9
- Content padding: 12px
- Badge: Top-left overlay on thumbnail with 8px margin

### 5. ServiceCard

**Anatomy:**
```
┌───────────┐
│           │
│   [Icon]  │
│   32x32   │
│           │
│  Label    │
│ (2 lines) │
│           │
└───────────┘
```
- Container: Square aspect ratio (1:1)
- Min size: 100x100px
- Icon: Material Symbol 32px, Electric Blue
- Label: Inter 13px semibold, center aligned, max 2 lines
- Background: White
- Border: 1px Gray 200
- Border Radius: 12px
- Hover: Scale 1.02, shadow medium

### 6. DisasterAlert

**Anatomy:**
```
┌─────────────────────────────────┐
│🔴 BAHAYA                         │
│                                  │
│ Banjir di Kecamatan Toroh        │
│ Ketinggian air 1.5m, evakuasi    │
│                                  │
│ 📍 Desa Toroh Kidul              │
│ 🕐 14 Apr 2026, 14:30 WIB        │
└──────────────────────────────────┘
```
- Border Left: 4px solid (color-coded)
- Background: Tinted 5% of status color
- Padding: 16px
- Border Radius: 12px (right side only)

**Color Coding:**
| Level | Border Color | Background | Icon |
|-------|--------------|------------|------|
| BAHAYA | Danger Red | Red @ 5% | 🔴 alert-triangle (animated pulse) |
| WASPADA | Warning Amber | Amber @ 5% | ⚠️ alert-triangle |
| AMAN | Success Green | Green @ 5% | ✅ check-circle |

### 7. HeroCarousel

**Specs:**
- Height: 240px (mobile), 320px (tablet+)
- Auto-play: 5 seconds
- Transition: Fade + slide (400ms)
- Indicators: Dots, Electric Blue (active), Gray 200 (inactive)
- Indicator size: 8px diameter, 16px spacing

**Slide Anatomy:**
```
┌─────────────────────────────────┐
│                                 │
│  Background Image               │
│  + Gradient Overlay             │
│  (transparent → rgba(0,0,0,0.6))│
│                                 │
│  [Judul (Calistoga 24px white)] │
│  [Deskripsi (Inter 14px white)] │
│  [CTA Button]                   │
│                                 │
└─────────────────────────────────┘
```

### 8. SkeletonLoader

**Card Variant:**
```
┌─────────────────────────┐
│                         │
│  [Shimmer Animation]    │
│  Base: Gray 200         │
│  Highlight: Gray 100    │
│  Period: 1500ms         │
│                         │
└─────────────────────────┘
```

**Text Variant:**
- Width: 100% (or specified)
- Height: 16px (single line)
- Border Radius: 4px

### 9. EmptyState

**Anatomy:**
```
       [Icon 64px Gray 500]
       
       Heading (Calistoga 20px)
       
       Description (Inter 14px Gray 500)
       Center aligned, max 2 lines
       
       [AppButton.secondary "Muat Ulang"]
```
- Centered vertically & horizontally
- Padding: 20px
- Max width: 320px

---

## 📱 Screen Layout Patterns

### 1. Standard Screen (Beranda)

```
┌──────────────────────────┐
│ AppBar (gradient)        │ ← 56px height
├──────────────────────────┤
│                          │
│ ScrollView               │
│ ├─ Hero (240px)          │
│ ├─ Section 1 (padding 32)│
│ ├─ Section 2             │
│ └─ Section 3             │
│                          │
│                          │
└──────────────────────────┘
│ Bottom Nav               │ ← 56px height
└──────────────────────────┘
```

**Screen Padding:** 20px horizontal

### 2. Detail Screen (BeritaDetail)

```
┌──────────────────────────┐
│ SliverAppBar (collapsed) │
│ ← Back   [Share Icon →]  │
├──────────────────────────┤
│                          │
│ Hero Image (250px)       │
│ + Gradient Overlay       │
│                          │
├──────────────────────────┤
│                          │
│ Content Card             │
│ (rounded top 24px)       │
│ Negative margin -20px    │
│                          │
│ Badge + Title + Meta     │
│ Divider                  │
│ Body Content (HTML)      │
│ Share Button             │
│                          │
└──────────────────────────┘
```

### 3. Form Screen (Pengaduan)

```
┌──────────────────────────┐
│ AppBar "Buat Pengaduan"  │
├──────────────────────────┤
│                          │
│ Form (ScrollView)        │
│ Padding: 20px            │
│                          │
│ ├─ TextField (spacing 16)│
│ ├─ TextField             │
│ ├─ Dropdown              │
│ ├─ TextArea              │
│ ├─ File Picker           │
│ │                        │
│ ├─ AppButton.primary     │
│ └─ TextButton (link)     │
│                          │
└──────────────────────────┘
```

**Field Spacing:** 16px vertical gap

### 4. Inverted Section Pattern

```
┌──────────────────────────┐
│ Standard White Section   │
│ (content)                │
├──────────────────────────┤
│ Charcoal Section         │ ← Background: #1A1D29
│ (inverted)               │
│                          │
│ White text + icons       │
│ Cards: Charcoal Light    │
│                          │
├──────────────────────────┤
│ Standard White Section   │
│ (content)                │
└──────────────────────────┘
```

**Usage:** Hero sections, feature callouts, Profil screen top

---

## 🎨 Component States

### Interactive State Matrix

| Component | Default | Hover | Pressed | Disabled | Loading |
|-----------|---------|-------|---------|----------|---------|
| **AppButton.primary** | Gradient + Blue shadow | - | Scale 0.98, Opacity 0.8 | Opacity 0.5 | Spinner (white) |
| **AppButton.secondary** | White + Blue border | Shadow small | Scale 0.98 | Opacity 0.5 | Spinner (blue) |
| **AppCard** | Shadow small | Shadow medium | - | - | Skeleton |
| **TextField** | Border Gray 200 | - | Border Blue 2px | Opacity 0.6 | - |
| **NewsCard** | Shadow small | Shadow medium, Scale 1.01 | Ripple effect | - | Skeleton |

### Focus States (Accessibility)

**Keyboard Focus:**
```dart
FocusedBorder: OutlineInputBorder(
  borderSide: BorderSide(color: electricBlue, width: 3),
  borderRadius: BorderRadius.circular(12),
)
```

**Focus Ring:**
- Color: Electric Blue
- Width: 3px
- Offset: 2px outside element

---

## ♿ Accessibility Guidelines

### Color Contrast

All text must meet WCAG 2.1 Level AA:
- **Normal text:** 4.5:1 minimum
- **Large text (18px+):** 3:1 minimum

**Verified Combinations:**
| Foreground | Background | Ratio | Pass? |
|------------|------------|-------|-------|
| Electric Blue | White | 7.5:1 | ✅ AAA |
| Gray 900 | White | 15.3:1 | ✅ AAA |
| Gray 500 | White | 4.6:1 | ✅ AA |
| White | Electric Blue | 7.5:1 | ✅ AAA |
| White | Charcoal | 14.2:1 | ✅ AAA |

### Semantic HTML Equivalents

Flutter doesn't use HTML, but semantics matter:

```dart
Semantics(
  label: 'Tombol kirim pengaduan',
  button: true,
  enabled: isEnabled,
  child: AppButton(...),
)
```

**Required Semantics:**
- All interactive elements: `button: true`, `label: 'Description'`
- Images: `image: true`, `label: 'Description of image'`
- Forms: `textField: true`, `label: 'Field name'`

### Touch Target Size

**Minimum:** 48x48px (Material Design standard)

**Implementation:**
```dart
InkWell(
  onTap: onTap,
  child: Container(
    constraints: BoxConstraints(minWidth: 48, minHeight: 48),
    child: content,
  ),
)
```

### Screen Reader Support

**Test With:**
- Android: TalkBack
- iOS: VoiceOver

**Best Practices:**
- Use Material widgets (built-in semantics)
- Provide `Semantics` wrapper for custom widgets
- Test every interactive flow with screen reader

---

## 📐 Responsive Breakpoints

| Breakpoint | Width | Layout Adjustments |
|------------|-------|-------------------|
| **Mobile Small** | 320px - 375px | Single column, 16px padding |
| **Mobile** | 376px - 599px | Single column, 20px padding |
| **Tablet** | 600px - 839px | Grid 2 columns for cards, 24px padding |
| **Desktop** | 840px+ | Max width 1200px, centered, 32px padding |

**Implementation:**
```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 600) {
      return MobileLayout();
    } else if (constraints.maxWidth < 840) {
      return TabletLayout();
    } else {
      return DesktopLayout();
    }
  },
)
```

---

## 🚀 Performance Guidelines

### Image Optimization

**Thumbnails:**
- Max resolution: 800x600px
- Format: WebP (fallback JPG)
- Lazy load: `CachedNetworkImage`

**Hero Images:**
- Max resolution: 1200x800px
- Compress: 80% quality
- CDN delivery

### List Performance

**Use `ListView.builder`:**
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => NewsCard(berita: items[index]),
  cacheExtent: 500, // Preload 500px off-screen
)
```

**Don't Use:** `ListView(children: [...])` for long lists

### Animation Performance

**Use `const` Constructors:**
```dart
const Text('Static text')
const Icon(Icons.home)
```

**Avoid Expensive Rebuilds:**
- Use `const` where possible
- Split widgets into smaller pieces
- Use `RepaintBoundary` for heavy widgets

---

## 🎯 Design Checklist (Per Screen)

Before marking a screen as "done":

- [ ] Color contrast meets WCAG AA (4.5:1 minimum)
- [ ] All interactive elements ≥ 48x48px
- [ ] Semantic labels on all widgets
- [ ] Loading states implemented (skeleton/spinner)
- [ ] Error states implemented (empty state + retry)
- [ ] Haptic feedback on key actions
- [ ] Animations smooth (60fps)
- [ ] Text scales with system font size
- [ ] Tested on 320px and 600px+ widths
- [ ] No hardcoded strings (use localization keys)

---

## 📚 Design Resources

### Figma Component Library
*(To be created)*
- AppCard variants
- AppButton variants
- Typography samples
- Color palette
- Iconography examples

### Design Tokens (JSON)
```json
{
  "colors": {
    "primary": "#0066FF",
    "primary-dark": "#0052CC",
    "charcoal": "#1A1D29",
    "success": "#10B981"
  },
  "spacing": {
    "xs": 8,
    "sm": 16,
    "md": 24,
    "lg": 32
  },
  "borderRadius": {
    "sm": 8,
    "md": 12,
    "lg": 16,
    "full": 9999
  }
}
```

---

**Document Version:** 1.0.0  
**Last Updated:** April 2026  
**Design Owner:** Portal Grobogan Team  
**Status:** Final for Development
