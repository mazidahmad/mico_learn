import 'package:equatable/equatable.dart';

import 'package:mico_learn/features/main/home/domain/entities/module.dart';

import '../../../home/domain/entities/course.dart';
import '../../../home/domain/entities/enrollment.dart';
import 'enrollment_lesson.dart';

class LearningDetail extends Equatable {
  final Enrollment enrollment;
  final Course course;
  final List<Module> modules;
  final List<EnrollmentLesson> enrollmentLessons;
  const LearningDetail({
    required this.enrollment,
    required this.course,
    required this.modules,
    required this.enrollmentLessons,
  });

  LearningDetail copyWith({
    Enrollment? enrollment,
    Course? course,
    List<Module>? modules,
    List<EnrollmentLesson>? enrollmentLessons,
  }) {
    return LearningDetail(
      enrollment: enrollment ?? this.enrollment,
      course: course ?? this.course,
      modules: modules ?? this.modules,
      enrollmentLessons: enrollmentLessons ?? this.enrollmentLessons,
    );
  }

  @override
  List<Object> get props => [enrollment, course, modules, enrollmentLessons];
}
