import 'package:carousel_slider/carousel_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/usecases/submit_assessment_quiz.dart';

import '../../../../../core/di/service_locator.dart';
import '../../domain/entities/quiz.dart';

part 'assessment_quiz_state.dart';

@Injectable()
class AssessmentQuizCubit extends Cubit<AssessmentQuizState> {
  AssessmentQuizCubit()
      : super(
          AssessmentQuizState(
            status: AssessmentQuizStatus.initial,
            currentIdx: 0,
            quiz: Quiz(
                id: '',
                createdAt: DateTime.now(),
                lessonId: '',
                questions: const [],
                title: ''),
            selectedChoices: const [],
          ),
        );

  final SubmitAssessmentQuiz _submitAssessmentQuiz =
      getIt<SubmitAssessmentQuiz>();

  final CarouselController carouselController = CarouselController();

  void initialize(Quiz quiz) async {
    emit(
      state.copyWith(
          status: AssessmentQuizStatus.loading,
          quiz: quiz,
          selectedChoices: quiz.questions.map((e) => '').toList()),
    );

    emit(state.copyWith(status: AssessmentQuizStatus.loaded));
  }

  void selectChoice(int questionIndex, String choiceId) async {
    emit(state.copyWith(status: AssessmentQuizStatus.loading));

    state.selectedChoices[questionIndex] = choiceId;

    emit(
      state.copyWith(
          status: AssessmentQuizStatus.loaded,
          selectedChoices: state.selectedChoices),
    );
  }

  void submitQuiz(String assessmentSessionId) async {
    emit(state.copyWith(status: AssessmentQuizStatus.loading));

    var result = await _submitAssessmentQuiz.execute(assessmentSessionId,
        state.quiz.questions.map((e) => e.id).toList(), state.selectedChoices);

    result.fold(
      (failure) => emit(state.copyWith(
          status: AssessmentQuizStatus.failed, failure: failure)),
      (data) => emit(
        state.copyWith(status: AssessmentQuizStatus.submitted),
      ),
    );
  }

  void previousQuestion() {
    carouselController.previousPage();
    emit(state.copyWith(currentIdx: state.currentIdx - 1));
  }

  void nextQuestion() {
    carouselController.nextPage();
    emit(state.copyWith(currentIdx: state.currentIdx + 1));
  }
}
