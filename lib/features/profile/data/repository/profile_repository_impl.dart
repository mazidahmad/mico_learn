import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/core/mixin/repository_mixin.dart';
import 'package:mico_learn/core/storage/storage.dart';
import 'package:mico_learn/features/profile/data/datasource/profile_remote_datasource.dart';

import '../../../../core/di/service_locator.dart';
import '../../domain/repository/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository with RepositoryMixin {
  final ProfileRemoteDatasource _remoteDatasource =
      getIt<ProfileRemoteDatasource>();

  @override
  Future<Either<Failure, void>> logout() => callDataSource(() async {
        await _remoteDatasource.logout();
        await getIt<Storage>().deleteData('account');
      });
}
