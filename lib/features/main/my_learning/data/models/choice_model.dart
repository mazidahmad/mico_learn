import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/choice.dart';

class ChoiceModel extends Choice {
  const ChoiceModel({
    required super.id,
    required super.createdAt,
    required super.option,
    required super.value,
    required super.questionId,
    required super.type,
  });

  factory ChoiceModel.fromMap(Map<String, dynamic> map) {
    return ChoiceModel(
      id: map['id'] as String,
      createdAt: DateTime.parse(map['created_at']),
      option: map['option'] as String,
      value: map['value'] as dynamic,
      questionId: map['question_id'] as String,
      type: map['type'],
    );
  }

  factory ChoiceModel.fromJson(String source) =>
      ChoiceModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
