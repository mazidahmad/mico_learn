import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/data/models/answer_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/choice_model.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/question.dart';

import 'contents/slide_content_model.dart';

class QuestionModel extends Question {
  const QuestionModel({
    required super.id,
    required super.createdAt,
    required super.quizId,
    required super.value,
    required super.answer,
    required super.choices,
    required super.sequence,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    var jsonValue = jsonDecode(map['value']);
    var data = jsonDecode(jsonValue);
    var newValue =
        SlideContentModel.fromMap(data.cast<Map<String, dynamic>>()).datas;

    return QuestionModel(
      id: map['id'] as String,
      createdAt: DateTime.parse(map['created_at']),
      quizId: map['quiz_id'] as String,
      value: newValue,
      answer: AnswerModel.fromMap(map['answer']),
      sequence: map['sequence'],
      choices:
          List.from(map['choice']).map((e) => ChoiceModel.fromMap(e)).toList(),
    );
  }

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
