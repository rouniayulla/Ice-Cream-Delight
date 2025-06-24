import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static const String supabaseUrl = 'https://ilbdnhtdvriqkfolwuze.supabase.co';
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlsYmRuaHRkdnJpcWtmb2x3dXplIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk3MzIwOTEsImV4cCI6MjA2NTMwODA5MX0.VoxV6Iipe-9O4TY6Lafr7jlFMSqG-XjMSrV2ePYgumg'; // truncated for safety

  static Future<void> init() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
