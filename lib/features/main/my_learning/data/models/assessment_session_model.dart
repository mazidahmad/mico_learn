import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_session.dart';

class AssessmentSessionModel extends AssessmentSession {
  const AssessmentSessionModel(
      {required super.id,
      required super.enrollmentId,
      required super.createdAt,
      super.duration,
      super.score});

  factory AssessmentSessionModel.fromMap(Map<String, dynamic> map) {
    return AssessmentSessionModel(
      id: map['id'] as String,
      enrollmentId: map['enrollment_id'] as String,
      createdAt: DateTime.parse(map['created_at']),
      duration: map['duration'],
      score: map['score'],
    );
  }

  factory AssessmentSessionModel.fromJson(String source) =>
      AssessmentSessionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
