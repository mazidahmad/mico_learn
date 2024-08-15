import 'package:equatable/equatable.dart';

import 'package:mico_learn/features/main/my_learning/domain/entities/question.dart';

class AssessmentQuizRecord extends Equatable {
  final String assessmentSessionId;
  final Question question;
  final String choiceId;
  final DateTime createdAt;

  const AssessmentQuizRecord({
    required this.assessmentSessionId,
    required this.question,
    required this.choiceId,
    required this.createdAt,
  });

  AssessmentQuizRecord copyWith({
    String? assessmentSessionId,
    Question? question,
    String? choiceId,
    DateTime? createdAt,
  }) {
    return AssessmentQuizRecord(
      assessmentSessionId: assessmentSessionId ?? this.assessmentSessionId,
      question: question ?? this.question,
      choiceId: choiceId ?? this.choiceId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object> get props =>
      [assessmentSessionId, question, choiceId, createdAt];
}
