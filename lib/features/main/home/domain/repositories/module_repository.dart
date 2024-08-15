import 'package:dartz/dartz.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/home/domain/entities/module.dart';

abstract class ModuleRepository {
  Future<Either<Failure, List<Module>>> fetchModulesByCourseId(String courseId);
}
