import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Supabase from .env
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] ?? 'https://xyzcompany.supabase.co',
    anonKey: dotenv.env['SUPABASE_KEY'] ?? dotenv.env['SUPABASE_ANON_KEY'] ?? 'public-anon-key',
  );

  runApp(
    const ProviderScope(
      child: PortalGroboganApp(),
    ),
  );
}
