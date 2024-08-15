part of 'learning_complete_cubit.dart';

sealed class LearningCompleteState extends Equatable {
  const LearningCompleteState();

  @override
  List<Object> get props => [];
}

final class LearningCompleteInitial extends LearningCompleteState {}

final class LearningCompleteLoading extends LearningCompleteState {}

final class LearningCompleteCompleted extends LearningCompleteState {}

final class LearningCompleteFailed extends LearningCompleteState {
  final Failure failure;

  const LearningCompleteFailed({required this.failure});
}
