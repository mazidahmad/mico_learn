import 'package:equatable/equatable.dart';

class EnrollmentCompletion extends Equatable {
  final String enrollmentId;
  final String accountId;
  final String courseName;
  final String bannerImage;
  final int totalModule;
  final int totalLesson;
  final int completedLesson;
  final double completionPercentage;

  const EnrollmentCompletion({
    required this.enrollmentId,
    required this.accountId,
    required this.courseName,
    required this.bannerImage,
    required this.totalModule,
    required this.totalLesson,
    required this.completedLesson,
    required this.completionPercentage,
  });

  EnrollmentCompletion copyWith({
    String? enrollmentId,
    String? accountId,
    String? courseName,
    String? bannerImage,
    int? totalModule,
    int? totalLesson,
    int? completedLesson,
    double? completionPercentage,
  }) {
    return EnrollmentCompletion(
      enrollmentId: enrollmentId ?? this.enrollmentId,
      accountId: accountId ?? this.accountId,
      courseName: courseName ?? this.courseName,
      bannerImage: bannerImage ?? this.bannerImage,
      totalModule: totalModule ?? this.totalModule,
      totalLesson: totalLesson ?? this.totalLesson,
      completedLesson: completedLesson ?? this.completedLesson,
      completionPercentage: completionPercentage ?? this.completionPercentage,
    );
  }

  @override
  List<Object> get props {
    return [
      enrollmentId,
      accountId,
      courseName,
      bannerImage,
      totalModule,
      totalLesson,
      completedLesson,
      completionPercentage,
    ];
  }
}
