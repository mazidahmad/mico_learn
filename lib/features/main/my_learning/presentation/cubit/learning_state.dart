part of 'learning_cubit.dart';

enum LearningStatus { initial, loading, loaded, failed }

class LearningState extends Equatable {
  const LearningState({
    required this.enrollmentId,
    required this.status,
    required this.contents,
    required this.completionContents,
    this.failure,
    this.assessmentSession,
  });

  final String enrollmentId;
  final LearningStatus status;
  final List<Content> contents;
  final List<bool> completionContents;
  final Failure? failure;
  final AssessmentSession? assessmentSession;

  @override
  List<Object?> get props => [
        enrollmentId,
        status,
        contents,
        failure,
        completionContents,
        assessmentSession
      ];

  LearningState copyWith({
    String? enrollmentId,
    LearningStatus? status,
    List<Content>? contents,
    Failure? failure,
    List<bool>? completionContents,
    AssessmentSession? assessmentSession,
  }) {
    return LearningState(
      enrollmentId: enrollmentId ?? this.enrollmentId,
      status: status ?? this.status,
      contents: contents ?? this.contents,
      failure: failure ?? this.failure,
      completionContents: completionContents ?? this.completionContents,
      assessmentSession: assessmentSession ?? this.assessmentSession,
    );
  }
}
