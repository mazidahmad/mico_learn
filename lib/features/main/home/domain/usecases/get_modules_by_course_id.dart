import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/home/domain/repositories/module_repository.dart';

import '../entities/module.dart' as course;

@Injectable()
class GetModulesByCourseId {
  final ModuleRepository _repo = getIt<ModuleRepository>();

  Future<Either<Failure, List<course.Module>>> execute(String courseId) =>
      _repo.fetchModulesByCourseId(courseId);
}
