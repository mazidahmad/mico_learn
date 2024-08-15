part of 'assessment_quiz_cubit.dart';

enum AssessmentQuizStatus { initial, loading, loaded, submitted, failed }

class AssessmentQuizState extends Equatable {
  const AssessmentQuizState(
      {required this.status,
      required this.quiz,
      required this.selectedChoices,
      required this.currentIdx,
      this.failure});

  final AssessmentQuizStatus status;
  final Quiz quiz;
  final List<String> selectedChoices;
  final int currentIdx;
  final Failure? failure;

  @override
  List<Object?> get props =>
      [status, quiz, currentIdx, selectedChoices, failure];

  AssessmentQuizState copyWith({
    AssessmentQuizStatus? status,
    Quiz? quiz,
    int? currentIdx,
    List<String>? selectedChoices,
    Failure? failure,
  }) {
    return AssessmentQuizState(
      status: status ?? this.status,
      quiz: quiz ?? this.quiz,
      currentIdx: currentIdx ?? this.currentIdx,
      selectedChoices: selectedChoices ?? this.selectedChoices,
      failure: failure ?? this.failure,
    );
  }
}
