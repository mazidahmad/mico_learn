import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/storage/storage.dart';
import 'package:mico_learn/features/auth/data/models/account_model.dart';

abstract class AuthLocalDatasource {
  Future<void> saveAccountInfo(AccountModel account);
}

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  final Storage _storage = getIt<Storage>();

  @override
  Future<void> saveAccountInfo(AccountModel account) async {
    await _storage.secureSave('account', account.toJson());
  }
}
