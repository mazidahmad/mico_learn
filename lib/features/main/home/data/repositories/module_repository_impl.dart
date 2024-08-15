import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/core/mixin/repository_mixin.dart';
import 'package:mico_learn/features/main/home/data/datasources/module_remote_datasource.dart';
import 'package:mico_learn/features/main/home/domain/entities/module.dart'
    as course;
import 'package:mico_learn/features/main/home/domain/repositories/module_repository.dart';

@Injectable(as: ModuleRepository)
class ModuleRepositoryImpl extends ModuleRepository with RepositoryMixin {
  final ModuleRemoteDatasource _moduleRemoteDatasource =
      getIt<ModuleRemoteDatasource>();

  @override
  Future<Either<Failure, List<course.Module>>> fetchModulesByCourseId(
          String courseId) =>
      callDataSource(
          () => _moduleRemoteDatasource.getModulesByCourseId(courseId));
}
