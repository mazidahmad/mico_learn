part of 'learning_detail_cubit.dart';

sealed class LearningDetailState extends Equatable {
  const LearningDetailState();

  @override
  List<Object> get props => [];
}

final class LearningDetailInitial extends LearningDetailState {}

final class LearningDetailLoading extends LearningDetailState {}

final class LearningDetailLoaded extends LearningDetailState {
  final LearningDetail learningDetail;

  const LearningDetailLoaded(this.learningDetail);
}

final class LearningDetailFailure extends LearningDetailState {
  final Failure failure;

  const LearningDetailFailure(this.failure);
}
