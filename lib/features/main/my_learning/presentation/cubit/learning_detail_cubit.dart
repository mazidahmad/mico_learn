import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/learning_detail.dart';
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_user_learning_detail.dart';

import '../../../../../core/di/service_locator.dart';

part 'learning_detail_state.dart';

@Injectable()
class LearningDetailCubit extends Cubit<LearningDetailState> {
  LearningDetailCubit() : super(LearningDetailInitial());

  final GetUserLearningDetail _getUserLearningDetail =
      getIt<GetUserLearningDetail>();

  void getUserLearningDetail(String enrollmentId) async {
    emit(LearningDetailLoading());

    var result = await _getUserLearningDetail.execute(enrollmentId);

    emit(
      result.fold(
        (failure) => LearningDetailFailure(failure),
        (learningDetail) => LearningDetailLoaded(learningDetail),
      ),
    );
  }
}
