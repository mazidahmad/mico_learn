import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/home/domain/entities/course.dart';
import 'package:mico_learn/features/main/home/domain/repositories/home_repository.dart';

@Injectable()
class GetAvailableCourses {
  final HomeRepository _repo = getIt<HomeRepository>();

  Future<Either<Failure, List<Course>>> execute() =>
      _repo.getAvailableCourses();
}
