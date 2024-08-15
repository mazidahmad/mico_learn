part of 'evaluation_cubit.dart';

sealed class EvaluationState extends Equatable {
  const EvaluationState();

  @override
  List<Object> get props => [];
}

final class EvaluationInitial extends EvaluationState {}

final class EvaluationLoading extends EvaluationState {}

final class EvaluationLoaded extends EvaluationState {
  final AssessmentQuizRecord record;

  const EvaluationLoaded(this.record);
}

final class EvaluationFailed extends EvaluationState {
  final Failure failure;

  const EvaluationFailed(this.failure);
}
