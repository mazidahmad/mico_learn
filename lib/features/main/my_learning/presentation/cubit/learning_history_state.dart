part of 'learning_history_cubit.dart';

sealed class LearningHistoryState extends Equatable {
  const LearningHistoryState();

  @override
  List<Object> get props => [];
}

final class LearningHistoryInitial extends LearningHistoryState {}

final class LearningHistoryLoading extends LearningHistoryState {}

final class LearningHistoryLoaded extends LearningHistoryState {
  final List<AssessmentResult> histories;

  const LearningHistoryLoaded(this.histories);
}

final class LearningHistoryFailed extends LearningHistoryState {
  final Failure failure;

  const LearningHistoryFailed(this.failure);
}
