import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/usecases/update_lesson_completion.dart';

part 'learning_complete_state.dart';

@Injectable()
class LearningCompleteCubit extends Cubit<LearningCompleteState> {
  LearningCompleteCubit() : super(LearningCompleteInitial());

  final UpdateLessonCompletion _updateLessonCompletion =
      getIt<UpdateLessonCompletion>();

  void updateLessonCompletion(String enrollmentId, String lessonId) async {
    emit(LearningCompleteLoading());

    var result = await _updateLessonCompletion.execute(enrollmentId, lessonId);

    emit(
      result.fold((failure) => LearningCompleteFailed(failure: failure),
          (_) => LearningCompleteCompleted()),
    );
  }
}
