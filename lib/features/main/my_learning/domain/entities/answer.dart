import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String questionId;
  final String choiceId;
  final List<dynamic>? explanation;
  final DateTime createdAt;

  const Answer({
    required this.questionId,
    required this.choiceId,
    this.explanation,
    required this.createdAt,
  });

  Answer copyWith({
    String? questionId,
    String? choiceId,
    List<dynamic>? explanation,
    DateTime? createdAt,
  }) {
    return Answer(
      questionId: questionId ?? this.questionId,
      choiceId: choiceId ?? this.choiceId,
      explanation: explanation ?? this.explanation,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [questionId, choiceId, explanation, createdAt];
}
