import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/bencana.dart';
import '../services/bencana_service.dart';
import 'supabase_provider.dart';

part 'bencana_provider.g.dart';

@riverpod
BencanaService bencanaService(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return BencanaService(client);
}

@riverpod
Stream<List<Bencana>> bencanaStream(Ref ref) {
  return ref.watch(bencanaServiceProvider).getBencanaStream();
}
