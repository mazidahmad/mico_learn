import 'package:dartz/dartz.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/home/domain/entities/course.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Course>>> getAvailableCourses();
}
