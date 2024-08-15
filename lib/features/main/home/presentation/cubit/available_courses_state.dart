part of 'available_courses_cubit.dart';

sealed class AvailableCoursesState extends Equatable {
  const AvailableCoursesState();

  @override
  List<Object> get props => [];
}

final class AvailableCoursesInitial extends AvailableCoursesState {}

final class AvailableCoursesLoading extends AvailableCoursesState {}

final class AvailableCoursesLoaded extends AvailableCoursesState {
  final List<Course> courses;

  const AvailableCoursesLoaded(this.courses);
}

final class AvailableCoursesFailed extends AvailableCoursesState {
  final Failure failure;

  const AvailableCoursesFailed(this.failure);
}
