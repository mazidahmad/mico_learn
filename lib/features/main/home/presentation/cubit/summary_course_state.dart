part of 'summary_course_cubit.dart';

sealed class SummaryCourseState extends Equatable {
  const SummaryCourseState();

  @override
  List<Object> get props => [];
}

final class SummaryCourseInitial extends SummaryCourseState {}

final class SummaryCourseLoading extends SummaryCourseState {}

final class SummaryCourseLoaded extends SummaryCourseState {
  final List<LessonQuizScore> quisScores;

  const SummaryCourseLoaded(this.quisScores);
}

final class SummaryCourseFailed extends SummaryCourseState {
  final Failure failure;

  const SummaryCourseFailed(this.failure);
}
