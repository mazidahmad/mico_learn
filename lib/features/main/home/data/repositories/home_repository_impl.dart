import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/core/mixin/repository_mixin.dart';
import 'package:mico_learn/features/main/home/data/datasources/home_remote_datasource.dart';
import 'package:mico_learn/features/main/home/domain/entities/course.dart';
import 'package:mico_learn/features/main/home/domain/repositories/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository with RepositoryMixin {
  final HomeRemoteDatasource _homeRemoteDatasource =
      getIt<HomeRemoteDatasource>();

  @override
  Future<Either<Failure, List<Course>>> getAvailableCourses() =>
      callDataSource(() => _homeRemoteDatasource.getAvailableCourses());
}
