import 'package:equatable/equatable.dart';

class LessonQuizScore extends Equatable {
  final String enrollmentId;
  final String lessonId;
  final DateTime createdAt;
  final int score;

  const LessonQuizScore({
    required this.enrollmentId,
    required this.lessonId,
    required this.createdAt,
    required this.score,
  });

  LessonQuizScore copyWith({
    String? enrollmentId,
    String? lessonId,
    DateTime? createdAt,
    int? score,
  }) {
    return LessonQuizScore(
      enrollmentId: enrollmentId ?? this.enrollmentId,
      lessonId: lessonId ?? this.lessonId,
      createdAt: createdAt ?? this.createdAt,
      score: score ?? this.score,
    );
  }

  @override
  List<Object> get props => [enrollmentId, lessonId, createdAt, score];
}
