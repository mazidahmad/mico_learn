import 'package:equatable/equatable.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/answer.dart';

import 'choice.dart';

class Question extends Equatable {
  final String id;
  final DateTime createdAt;
  final String quizId;
  final List<dynamic> value;
  final List<Choice> choices;
  final Answer answer;
  final int sequence;

  const Question({
    required this.id,
    required this.createdAt,
    required this.quizId,
    required this.value,
    required this.choices,
    required this.answer,
    required this.sequence,
  });

  Question copyWith({
    String? id,
    DateTime? createdAt,
    String? quizId,
    List<dynamic>? value,
    List<Choice>? choices,
    Answer? answer,
    int? sequence,
  }) {
    return Question(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      quizId: quizId ?? this.quizId,
      value: value ?? this.value,
      choices: choices ?? this.choices,
      answer: answer ?? this.answer,
      sequence: sequence ?? this.sequence,
    );
  }

  @override
  List<Object> get props =>
      [id, createdAt, quizId, value, choices, answer, sequence];
}
