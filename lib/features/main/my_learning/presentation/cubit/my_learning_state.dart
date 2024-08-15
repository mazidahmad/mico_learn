part of 'my_learning_cubit.dart';

sealed class MyLearningState extends Equatable {
  const MyLearningState();

  @override
  List<Object> get props => [];
}

final class MyLearningInitial extends MyLearningState {}

final class MyLearningLoading extends MyLearningState {}

final class MyLearningLoaded extends MyLearningState {
  final List<EnrollmentCompletion> enrollments;

  const MyLearningLoaded(this.enrollments);
}

final class MyLearningFailed extends MyLearningState {
  final Failure failure;

  const MyLearningFailed(this.failure);
}
