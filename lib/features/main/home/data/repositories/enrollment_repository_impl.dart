import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/core/mixin/repository_mixin.dart';
import 'package:mico_learn/features/main/home/data/datasources/enrollment_remote_datasource.dart';
import 'package:mico_learn/features/main/home/domain/entities/enrollment.dart';
import 'package:mico_learn/features/main/home/domain/repositories/enrollment_repository.dart';

@Injectable(as: EnrollmentRepository)
class EnrollmentRepositoryImpl extends EnrollmentRepository
    with RepositoryMixin {
  final EnrollmentRemoteDatasource _remoteDatasource =
      getIt<EnrollmentRemoteDatasource>();

  @override
  Future<Either<Failure, Enrollment>> enrollCourse(String courseId) =>
      callDataSource(() => _remoteDatasource.enrollCourse(courseId));

  @override
  Future<Either<Failure, Enrollment?>> checkEnrollmentStatus(String courseId) =>
      callDataSource(() => _remoteDatasource.checkEnrollmentStatus(courseId));
}
