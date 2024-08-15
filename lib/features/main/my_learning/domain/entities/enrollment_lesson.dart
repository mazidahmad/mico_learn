import 'package:equatable/equatable.dart';

class EnrollmentLesson extends Equatable {
  final String enrollmentId;
  final bool isCompleted;
  final String id;
  final String moduleId;
  final int sequenceNumber;
  final String title;
  final String? category;

  const EnrollmentLesson({
    required this.enrollmentId,
    required this.isCompleted,
    required this.id,
    required this.moduleId,
    required this.sequenceNumber,
    required this.title,
    this.category,
  });

  EnrollmentLesson copyWith({
    String? enrollmentId,
    bool? isCompleted,
    String? id,
    String? moduleId,
    int? sequenceNumber,
    String? title,
    String? category,
  }) {
    return EnrollmentLesson(
      enrollmentId: enrollmentId ?? this.enrollmentId,
      isCompleted: isCompleted ?? this.isCompleted,
      id: id ?? this.id,
      moduleId: moduleId ?? this.moduleId,
      sequenceNumber: sequenceNumber ?? this.sequenceNumber,
      title: title ?? this.title,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props {
    return [
      enrollmentId,
      isCompleted,
      id,
      moduleId,
      sequenceNumber,
      title,
      category,
    ];
  }
}
