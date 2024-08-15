import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/enrollment_completion.dart';

class EnrollmentCompletionModel extends EnrollmentCompletion {
  const EnrollmentCompletionModel(
      {required super.enrollmentId,
      required super.accountId,
      required super.courseName,
      required super.bannerImage,
      required super.totalModule,
      required super.totalLesson,
      required super.completedLesson,
      required super.completionPercentage});

  factory EnrollmentCompletionModel.fromMap(Map<String, dynamic> map) {
    return EnrollmentCompletionModel(
      enrollmentId: map['enrollment_id'] as String,
      accountId: map['account_id'] as String,
      courseName: map['course_name'] as String,
      bannerImage: map['banner_image'] as String,
      totalModule: map['total_modules'] as int,
      totalLesson: map['total_lessons'] as int,
      completedLesson: map['completed_lessons'] as int,
      completionPercentage: map['completion_percentage'] is int
          ? (map['completion_percentage'] as int).toDouble()
          : map['completion_percentage'],
    );
  }

  factory EnrollmentCompletionModel.fromJson(String source) =>
      EnrollmentCompletionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
