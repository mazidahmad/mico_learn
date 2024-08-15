import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/data/models/question_model.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/quiz.dart';

class QuizModel extends Quiz {
  const QuizModel({
    required super.id,
    required super.lessonId,
    required super.createdAt,
    required super.title,
    required super.questions,
  });

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] as String,
      lessonId: map['lesson_id'] as String,
      createdAt: DateTime.parse(map['created_at']),
      title: map['title'] as String,
      questions: List.from(map['question'])
          .map((e) => QuestionModel.fromMap(e))
          .toList(),
    );
  }

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
