import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/lesson_completion.dart';

class LessonCompletionModel extends LessonCompletion {
  const LessonCompletionModel(
      {required super.id, required super.name, required super.isCompleted});

  factory LessonCompletionModel.fromMap(Map<String, dynamic> map) {
    return LessonCompletionModel(
      id: map['id'] as String,
      name: map['name'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  factory LessonCompletionModel.fromJson(String source) =>
      LessonCompletionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
