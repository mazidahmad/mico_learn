import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/core/mixin/repository_mixin.dart';
import 'package:mico_learn/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:mico_learn/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:mico_learn/features/auth/domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository with RepositoryMixin {
  final AuthRemoteDatasource _remoteDatasource = getIt<AuthRemoteDatasource>();
  final AuthLocalDatasource _authLocalDatasource = getIt<AuthLocalDatasource>();

  @override
  Future<Either<Failure, void>> signInGoogle() => callDataSource(
        () async {
          var googleAuth = await _remoteDatasource.googleSignIn();
          var authResponse = await _remoteDatasource.supabaseGoogleSignIn(
              googleAuth.idToken!, googleAuth.accessToken!);

          var isRegistered = await _remoteDatasource
              .checkIsUserRegistered(authResponse.user!.email!);
          if (!isRegistered) {
            await _remoteDatasource.registerUser(authResponse.user!);
          }
          var account =
              await _remoteDatasource.getAccountInfo(authResponse.user!.email!);

          await _authLocalDatasource.saveAccountInfo(account);
        },
      );
}
