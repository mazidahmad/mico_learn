import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/network/supabase_module.dart';
import 'package:mico_learn/features/auth/data/models/account_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/storage/storage.dart';

abstract class StartupLocalDatasource {
  Future<Session?> getSession();
  Future<AccountModel?> getAccountInfo();
}

@Injectable(as: StartupLocalDatasource)
class StartupLocalDatasourceImpl extends StartupLocalDatasource {
  final SupabaseModule _supabaseModule = getIt<SupabaseModule>();
  final Storage _storage = getIt<Storage>();

  @override
  Future<Session?> getSession() async {
    return _supabaseModule.client.auth.currentSession;
  }

  @override
  Future<AccountModel?> getAccountInfo() async {
    var data = await _storage.secureRead('account');

    if (data != null) {
      return AccountModel.fromJson(data);
    }
    return null;
  }
}
