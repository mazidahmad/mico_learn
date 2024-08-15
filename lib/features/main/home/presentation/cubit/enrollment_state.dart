part of 'enrollment_cubit.dart';

enum EnrollmentStatus { initial, loading, loaded, success, failed }

class EnrollmentState extends Equatable {
  const EnrollmentState({this.enrollment, required this.status, this.failure});

  final Enrollment? enrollment;
  final EnrollmentStatus status;
  final Failure? failure;

  EnrollmentState copyWith({
    required EnrollmentStatus status,
    Enrollment? enrollment,
    Failure? failure,
  }) {
    return EnrollmentState(
      status: status,
      failure: failure ?? this.failure,
      enrollment: enrollment ?? this.enrollment,
    );
  }

  @override
  List<Object?> get props => [enrollment, status, failure];
}
