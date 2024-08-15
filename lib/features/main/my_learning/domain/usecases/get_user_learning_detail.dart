import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/learning_detail.dart';
import 'package:mico_learn/features/main/my_learning/domain/repositories/my_learning_repository.dart';

@Injectable()
class GetUserLearningDetail {
  final MyLearningRepository _repo = getIt<MyLearningRepository>();

  Future<Either<Failure, LearningDetail>> execute(String enrollmentId) =>
      _repo.getLearningDetail(enrollmentId);
}
