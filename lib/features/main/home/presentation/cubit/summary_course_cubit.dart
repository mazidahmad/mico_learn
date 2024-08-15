import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/lesson_quiz_score.dart';
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_user_lesson_quiz_scores.dart';

part 'summary_course_state.dart';

@Injectable()
class SummaryCourseCubit extends Cubit<SummaryCourseState> {
  SummaryCourseCubit() : super(SummaryCourseInitial());

  final GetUserLessonQuizScores _getUserLessonQuizScores =
      getIt<GetUserLessonQuizScores>();

  void getUserLessonQuizScores(String enrollmentId) async {
    emit(SummaryCourseLoading());

    var result = await _getUserLessonQuizScores.execute(enrollmentId);

    emit(
      result.fold(
        (failure) => SummaryCourseFailed(failure),
        (data) => SummaryCourseLoaded(data),
      ),
    );
  }
}
