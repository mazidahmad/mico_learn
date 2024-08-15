import 'dart:convert';

import 'package:mico_learn/features/main/home/domain/entities/enrollment.dart';

class EnrollmentModel extends Enrollment {
  const EnrollmentModel(
      {required super.id,
      required super.courseId,
      required super.accountId,
      required super.createdAt});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'course_id': courseId,
      'account_id': accountId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory EnrollmentModel.fromMap(Map<String, dynamic> map) {
    return EnrollmentModel(
      id: map['id'] as String,
      courseId: map['course_id'] as String,
      accountId: map['account_id'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory EnrollmentModel.fromJson(String source) =>
      EnrollmentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
