import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/data/models/question_model.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment_quiz_record.dart';

class AssessmentQuizRecordModel extends AssessmentQuizRecord {
  const AssessmentQuizRecordModel(
      {required super.assessmentSessionId,
      required super.question,
      required super.choiceId,
      required super.createdAt});

  factory AssessmentQuizRecordModel.fromMap(Map<String, dynamic> map) {
    return AssessmentQuizRecordModel(
      assessmentSessionId: map['assessment_session_id'] as String,
      question: QuestionModel.fromMap(map['question'] as Map<String, dynamic>),
      choiceId: map['choice_id'] as String,
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  factory AssessmentQuizRecordModel.fromJson(String source) =>
      AssessmentQuizRecordModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
