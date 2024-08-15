import 'dart:convert';

import '../../domain/entities/assessment_result.dart';

class AssessmentResultModel extends AssessmentResult {
  const AssessmentResultModel(
      {required super.assessmentSessionId,
      required super.enrollmentId,
      required super.lessonId,
      required super.createdAt,
      required super.score});

  AssessmentResult copyWith({
    String? assessmentSessionId,
    String? enrollmentId,
    String? lessonId,
    DateTime? createdAt,
    int? score,
  }) {
    return AssessmentResult(
      assessmentSessionId: assessmentSessionId ?? this.assessmentSessionId,
      enrollmentId: enrollmentId ?? this.enrollmentId,
      lessonId: lessonId ?? this.lessonId,
      createdAt: createdAt ?? this.createdAt,
      score: score ?? this.score,
    );
  }

  factory AssessmentResultModel.fromMap(Map<String, dynamic> map) {
    return AssessmentResultModel(
      assessmentSessionId: map['assessment_session_id'] as String,
      enrollmentId: map['enrollment_id'] as String,
      lessonId: map['lesson_id'] as String,
      createdAt: DateTime.parse(map['created_at']),
      score: map['score'] as int,
    );
  }

  factory AssessmentResultModel.fromJson(String source) =>
      AssessmentResultModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
