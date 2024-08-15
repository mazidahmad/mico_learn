import 'package:equatable/equatable.dart';

import 'question.dart';

class Quiz extends Equatable {
  final String id;
  final String lessonId;
  final DateTime createdAt;
  final String title;
  final List<Question> questions;

  const Quiz({
    required this.id,
    required this.lessonId,
    required this.createdAt,
    required this.title,
    required this.questions,
  });

  Quiz copyWith({
    String? id,
    String? lessonId,
    DateTime? createdAt,
    String? title,
    List<Question>? questions,
  }) {
    return Quiz(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      questions: questions ?? this.questions,
    );
  }

  @override
  List<Object> get props => [id, lessonId, createdAt, title, questions];
}
