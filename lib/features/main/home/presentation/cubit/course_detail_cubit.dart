import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart' as inject;
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/features/main/home/domain/usecases/get_modules_by_course_id.dart';

import '../../../../../core/error/failures.dart';
import '../../domain/entities/course.dart';
import '../../domain/entities/module.dart';

part 'course_detail_state.dart';

@inject.Injectable()
class CourseDetailCubit extends Cubit<CourseDetailState> {
  CourseDetailCubit()
      : super(
          CourseDetailState(
            course: Course(
              id: '',
              name: '',
              bannerImage: '',
              description: '',
              createdAt: DateTime.parse('2024-10-10'),
            ),
            modules: const [],
            status: CourseDetailStatus.initial,
          ),
        );

  final GetModulesByCourseId _getModulesByCourseId =
      getIt<GetModulesByCourseId>();

  void fetchModules(Course course) async {
    emit(state.copyWith(status: CourseDetailStatus.loading, course: course));

    var result = await _getModulesByCourseId.execute(course.id);

    emit(
      result.fold(
        (failure) =>
            state.copyWith(status: CourseDetailStatus.failed, failure: failure),
        (modules) => state
            .copyWith(status: CourseDetailStatus.loaded, modules: [...modules]),
      ),
    );
  }
}
