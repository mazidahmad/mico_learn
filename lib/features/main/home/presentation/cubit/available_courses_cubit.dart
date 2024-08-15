import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/error/failures.dart';
import 'package:mico_learn/features/main/home/domain/entities/course.dart';
import 'package:mico_learn/features/main/home/domain/usecases/get_available_courses.dart';

part 'available_courses_state.dart';

@Injectable()
class AvailableCoursesCubit extends Cubit<AvailableCoursesState> {
  AvailableCoursesCubit() : super(AvailableCoursesInitial());

  final GetAvailableCourses _getAvailableCourses = getIt<GetAvailableCourses>();

  void fetchAvailableCourses() async {
    emit(AvailableCoursesLoading());

    var result = await _getAvailableCourses.execute();

    emit(
      result.fold(
        (failure) => AvailableCoursesFailed(failure),
        (courses) => AvailableCoursesLoaded(courses),
      ),
    );
  }
}
