import 'package:dartz/dartz.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/home/domain/entities/enrollment.dart';

abstract class EnrollmentRepository {
  Future<Either<Failure, Enrollment>> enrollCourse(String courseId);
  Future<Either<Failure, Enrollment?>> checkEnrollmentStatus(String courseId);
}
