import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/repositories/my_learning_repository.dart';

import '../../../../../core/di/service_locator.dart';
import '../entities/content.dart';

@Injectable()
class GetLessonContents {
  final MyLearningRepository _repo = getIt<MyLearningRepository>();

  Future<Either<Failure, List<Content>>> execute(String lessonId) =>
      _repo.getLessonContents(lessonId);
}
