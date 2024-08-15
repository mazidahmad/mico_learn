// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'course_detail_cubit.dart';

enum CourseDetailStatus { initial, loading, loaded, failed }

class CourseDetailState extends Equatable {
  const CourseDetailState(
      {required this.course,
      required this.modules,
      required this.status,
      this.failure});

  final Course course;
  final List<Module> modules;
  final CourseDetailStatus status;
  final Failure? failure;

  @override
  List<Object?> get props => [course, modules, status, failure];

  CourseDetailState copyWith({
    Course? course,
    List<Module>? modules,
    CourseDetailStatus? status,
    Failure? failure,
  }) {
    return CourseDetailState(
      course: course ?? this.course,
      modules: modules ?? this.modules,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
