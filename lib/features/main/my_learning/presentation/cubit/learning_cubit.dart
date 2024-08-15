import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/content.dart';
import 'package:mico_learn/features/main/my_learning/domain/usecases/create_assessment_session.dart';
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_lesson_contents.dart';

import '../../domain/entities/assessment_session.dart';

part 'learning_state.dart';

@Injectable()
class LearningCubit extends Cubit<LearningState> {
  LearningCubit()
      : super(const LearningState(
            enrollmentId: '',
            status: LearningStatus.initial,
            contents: [],
            completionContents: []));

  final GetLessonContents _getLessonContents = getIt<GetLessonContents>();
  final CreateAssessmentSession _createAssessmentSession =
      getIt<CreateAssessmentSession>();

  void initializeLearning(String enrollmentId, String lessonId) async {
    emit(state.copyWith(status: LearningStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    var result = await _getLessonContents.execute(lessonId);

    result.fold(
      (failure) =>
          emit(state.copyWith(status: LearningStatus.failed, failure: failure)),
      (data) async {
        if (data.any((element) => element.type == 'assessment')) {
          var assessment = data
              .firstWhere((element) => element.type == 'assessment')
              .value as Assessment;

          var resultAssessment = await _createAssessmentSession.execute(
              enrollmentId, assessment.id);

          resultAssessment.fold(
            (failure) => emit(state.copyWith(
                status: LearningStatus.failed, failure: failure)),
            (assessmentSession) {
              List<bool> completions = data.map((e) => false).toList();
              emit(
                state.copyWith(
                  status: LearningStatus.loaded,
                  contents: data,
                  completionContents: completions,
                  assessmentSession: assessmentSession,
                ),
              );
            },
          );
        } else {
          List<bool> completions = data.map((e) => false).toList();
          emit(
            state.copyWith(
              status: LearningStatus.loaded,
              contents: data,
              completionContents: completions,
            ),
          );
        }
      },
    );
  }

  void completeContent(int index) {
    emit(state.copyWith(status: LearningStatus.loading));
    state.completionContents[index] = true;
    emit(state.copyWith(
        status: LearningStatus.loaded,
        completionContents: state.completionContents));
  }
}
