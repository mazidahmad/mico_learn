import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/home/domain/usecases/enrollment/check_enrollment_status.dart';
import 'package:mico_learn/features/main/home/domain/usecases/enrollment/enroll_course.dart';

import '../../../../../core/di/service_locator.dart';
import '../../domain/entities/enrollment.dart';

part 'enrollment_state.dart';

@Injectable()
class EnrollmentCubit extends Cubit<EnrollmentState> {
  EnrollmentCubit()
      : super(const EnrollmentState(status: EnrollmentStatus.initial));

  final CheckEnrollmentStatus _checkEnrollmentStatus =
      getIt<CheckEnrollmentStatus>();
  final EnrollCourse _enrollCourse = getIt<EnrollCourse>();

  void checkEnrollment(String courseId) async {
    emit(state.copyWith(status: EnrollmentStatus.loading));

    var result = await _checkEnrollmentStatus.execute(courseId);

    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: EnrollmentStatus.failed, failure: failure),
        (enrollment) => state.copyWith(
            status: EnrollmentStatus.loaded, enrollment: enrollment),
      ),
    );
  }

  void enrollCourse(String courseId) async {
    emit(state.copyWith(status: EnrollmentStatus.loading));

    var result = await _enrollCourse.execute(courseId);

    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: EnrollmentStatus.failed, failure: failure),
        (enrollment) => state.copyWith(
            status: EnrollmentStatus.success, enrollment: enrollment),
      ),
    );
  }
}
