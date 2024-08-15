import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/data/models/contents/image_content_model.dart';

import '../../domain/entities/answer.dart';

class AnswerModel extends Answer {
  const AnswerModel(
      {required super.questionId,
      required super.choiceId,
      super.explanation,
      required super.createdAt});

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    List? explanation;

    if (map['explanation'] != null) {
      List listExplanation = jsonDecode(jsonDecode(map['explanation']));

      explanation = List.from(listExplanation).map((data) {
        switch (data['type']) {
          case 'image':
            return ImageContentModel(url: data['value']);
          default:
            return data['value'] as String;
        }
      }).toList();
    }

    return AnswerModel(
      questionId: map['question_id'] as String,
      choiceId: map['choice_id'] as String,
      explanation: explanation,
      createdAt: DateTime.parse(map['created_at']),
    );
  }

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
