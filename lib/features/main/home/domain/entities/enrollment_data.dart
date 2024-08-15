import 'package:equatable/equatable.dart';
import 'package:mico_learn/features/main/home/domain/entities/course.dart';

class EnrollmentData extends Equatable {
  final String id;
  final Course course;
  final DateTime createdAt;

  const EnrollmentData({
    required this.id,
    required this.course,
    required this.createdAt,
  });

  EnrollmentData copyWith({
    String? id,
    Course? course,
    DateTime? createdAt,
  }) {
    return EnrollmentData(
      id: id ?? this.id,
      course: course ?? this.course,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object> get props => [id, course, createdAt];
}
