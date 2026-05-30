import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/hero_slide.dart';
import 'supabase_provider.dart';

part 'hero_slides_provider.g.dart';

@riverpod
Future<List<HeroSlide>> heroSlides(Ref ref) async {
  final supabase = ref.watch(supabaseClientProvider);
  
  try {
    final response = await supabase
        .from('hero_slides')
        .select()
        .eq('aktif', true)
        .order('urutan', ascending: true);
        
    final List<dynamic> data = response;
    return data.map((json) => HeroSlide.fromJson(json as Map<String, dynamic>)).toList();
  } catch (e) {
    print('Error fetching banners: $e');
    // Kembalikan empty list atau throw error jika gagal
    return [];
  }
}
