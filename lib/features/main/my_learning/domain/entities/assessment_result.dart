import 'package:equatable/equatable.dart';

class AssessmentResult extends Equatable {
  final String assessmentSessionId;
  final String enrollmentId;
  final String lessonId;
  final DateTime createdAt;
  final int score;

  const AssessmentResult({
    required this.assessmentSessionId,
    required this.enrollmentId,
    required this.lessonId,
    required this.createdAt,
    required this.score,
  });

  @override
  List<Object> get props {
    return [
      assessmentSessionId,
      enrollmentId,
      lessonId,
      createdAt,
      score,
    ];
  }
}
