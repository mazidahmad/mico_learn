import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/assessment.dart';

class AssessmentModel extends Assessment {
  const AssessmentModel({
    required super.id,
    required super.createdAt,
    required super.lessonId,
    required super.type,
    required super.value,
  });

  factory AssessmentModel.fromMap(Map<String, dynamic> map) {
    return AssessmentModel(
      id: map['id'] as String,
      createdAt: DateTime.parse(map['created_at']),
      lessonId: map['lesson_id'] as String,
      type: map['type'] as String,
      value: map['value'] as dynamic,
    );
  }

  factory AssessmentModel.fromJson(String source) =>
      AssessmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
