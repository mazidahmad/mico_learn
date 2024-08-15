import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/network/http_module.dart';
import 'package:mico_learn/core/network/supabase_module.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/di/service_locator.dart';

abstract class StartupRemoteDatasource {
  Future<AuthResponse> refreshSession(String? refreshToken);
}

@Injectable(as: StartupRemoteDatasource)
class StartupRemoteDatasourceImpl extends StartupRemoteDatasource {
  final SupabaseModule _supabaseModule = getIt<SupabaseModule>();
  final HttpModule _httpModule = getIt<HttpModule>();

  @override
  Future<AuthResponse> refreshSession(String? refreshToken) async {
    var authResponse =
        await _supabaseModule.client.auth.refreshSession(refreshToken);
    _httpModule.overrideAuthorizationHeader(authResponse.session!.accessToken);
    return authResponse;
  }
}
