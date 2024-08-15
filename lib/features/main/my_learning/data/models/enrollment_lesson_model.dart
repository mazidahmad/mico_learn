import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/enrollment_lesson.dart';

class EnrollmentLessonModel extends EnrollmentLesson {
  const EnrollmentLessonModel(
      {required super.enrollmentId,
      required super.isCompleted,
      required super.id,
      required super.moduleId,
      required super.sequenceNumber,
      required super.title,
      super.category});

  factory EnrollmentLessonModel.fromMap(Map<String, dynamic> map) {
    return EnrollmentLessonModel(
      enrollmentId: map['enrollment_id'] as String,
      isCompleted: map['is_completed'] as bool,
      id: map['id'] as String,
      moduleId: map['module_id'] as String,
      sequenceNumber: map['sequence_number'] as int,
      title: map['title'] as String,
      category: map['category'] as String?,
    );
  }

  factory EnrollmentLessonModel.fromJson(String source) =>
      EnrollmentLessonModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
