import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_quiz_record.dart';
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_learning_evaluation.dart';

part 'evaluation_state.dart';

@Injectable()
class EvaluationCubit extends Cubit<EvaluationState> {
  EvaluationCubit() : super(EvaluationInitial());

  final GetLearningEvaluation _getLearningEvaluation =
      getIt<GetLearningEvaluation>();

  void getLearningEvaluation(String assessmentSessionId) async {
    emit(EvaluationLoading());

    var result = await _getLearningEvaluation.execute(assessmentSessionId);

    emit(
      result.fold(
        (failure) => EvaluationFailed(failure),
        (data) => EvaluationLoaded(data),
      ),
    );
  }
}
