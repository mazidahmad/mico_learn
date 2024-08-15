import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_result.dart';
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_learning_history.dart';

import '../../../../../core/di/service_locator.dart';

part 'learning_history_state.dart';

@Injectable()
class LearningHistoryCubit extends Cubit<LearningHistoryState> {
  LearningHistoryCubit() : super(LearningHistoryInitial());

  final GetLearningHistory _getLearningHistory = getIt<GetLearningHistory>();

  void getLearningHistory(String enrollmentId, String lessonId) async {
    emit(LearningHistoryLoading());

    var result = await _getLearningHistory.execute(lessonId, enrollmentId);

    emit(
      result.fold(
        (failure) => LearningHistoryFailed(failure),
        (data) => LearningHistoryLoaded(data),
      ),
    );
  }
}
