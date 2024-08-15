import 'package:equatable/equatable.dart';

class AssessmentSession extends Equatable {
  final String id;
  final String enrollmentId;
  final DateTime createdAt;
  final int? duration;
  final int? score;

  const AssessmentSession({
    required this.id,
    required this.enrollmentId,
    required this.createdAt,
    this.duration,
    this.score,
  });

  AssessmentSession copyWith({
    String? id,
    String? enrollmentId,
    DateTime? createdAt,
    int? duration,
    int? score,
  }) {
    return AssessmentSession(
      id: id ?? this.id,
      enrollmentId: enrollmentId ?? this.enrollmentId,
      createdAt: createdAt ?? this.createdAt,
      duration: duration ?? this.duration,
      score: score ?? this.score,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      enrollmentId,
      createdAt,
      duration,
      score,
    ];
  }
}
