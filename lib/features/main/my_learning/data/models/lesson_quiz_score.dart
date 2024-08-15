import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/lesson_quiz_score.dart';

class LessonQuizScoreModel extends LessonQuizScore {
  const LessonQuizScoreModel(
      {required super.enrollmentId,
      required super.lessonId,
      required super.createdAt,
      required super.score});

  factory LessonQuizScoreModel.fromMap(Map<String, dynamic> map) {
    return LessonQuizScoreModel(
      enrollmentId: map['enrollment_id'] as String,
      lessonId: map['lesson_id'] as String,
      createdAt: DateTime.parse(map['created_at']),
      score: map['score'] as int,
    );
  }

  factory LessonQuizScoreModel.fromJson(String source) =>
      LessonQuizScoreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
