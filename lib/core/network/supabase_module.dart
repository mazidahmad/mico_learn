import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseModule {
  late final SupabaseClient client;

  SupabaseModule.initialize() {
    client = Supabase.instance.client;
  }
}
