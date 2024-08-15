import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/network/supabase_module.dart';

import '../../../../core/di/service_locator.dart';

abstract class ProfileRemoteDatasource {
  Future<void> logout();
}

@Injectable(as: ProfileRemoteDatasource)
class ProfileRemoteDatasourceImpl extends ProfileRemoteDatasource {
  final SupabaseModule _supabaseModule = getIt<SupabaseModule>();

  @override
  Future<void> logout() async {
    await _supabaseModule.client.auth.signOut();
  }
}
