import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/home/domain/entities/enrollment.dart';
import 'package:mico_learn/features/main/home/domain/repositories/enrollment_repository.dart';

@Injectable()
class EnrollCourse {
  final EnrollmentRepository _repo = getIt<EnrollmentRepository>();

  Future<Either<Failure, Enrollment>> execute(String courseId) =>
      _repo.enrollCourse(courseId);
}
