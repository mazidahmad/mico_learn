import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/core/mixin/repository_mixin.dart';
import 'package:mico_learn/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:mico_learn/features/auth/domain/entities/account.dart';
import 'package:mico_learn/features/startup/data/datasource/startup_local_datasource.dart';
import 'package:mico_learn/features/startup/data/datasource/startup_remote_datasource.dart';
import 'package:mico_learn/features/startup/domain/repositories/startup_repository.dart';

@Injectable(as: StartupRepository)
class StartupRepositoryImpl extends StartupRepository with RepositoryMixin {
  final StartupRemoteDatasource _remoteDatasource =
      getIt<StartupRemoteDatasource>();
  final StartupLocalDatasource _localDatasource =
      getIt<StartupLocalDatasource>();
  final AuthRemoteDatasource _authRemoteDatasource =
      getIt<AuthRemoteDatasource>();

  @override
  Future<Either<Failure, bool>> isHasSession() => callDataSource(
        () async {
          var session = await _localDatasource.getSession();
          if (session == null) return false;
          var authResponse =
              await _remoteDatasource.refreshSession(session.refreshToken);
          var newSession = authResponse.session;
          if (newSession == null) return false;
          return true;
        },
      );

  @override
  Future<Either<Failure, Account?>> getAccountInfo() =>
      callDataSource(() async {
        var account = await _localDatasource.getAccountInfo();
        if (account == null) return null;
        return await _authRemoteDatasource.getAccountInfo(account.email);
      });
}
