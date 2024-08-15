import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_user_enrollments.dart';

import '../../../../../core/di/service_locator.dart';
import '../../domain/entities/enrollment_completion.dart';

part 'my_learning_state.dart';

@Injectable()
class MyLearningCubit extends Cubit<MyLearningState> {
  MyLearningCubit() : super(MyLearningInitial());

  final GetUserEnrollments _getUserEnrollments = getIt<GetUserEnrollments>();

  void getUserEnrollments() async {
    emit(MyLearningLoading());

    var result = await _getUserEnrollments.execute();

    emit(
      result.fold(
        (failure) => MyLearningFailed(failure),
        (enrollments) => MyLearningLoaded(enrollments),
      ),
    );
  }
}
