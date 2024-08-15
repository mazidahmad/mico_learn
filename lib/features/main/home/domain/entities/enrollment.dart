import 'package:equatable/equatable.dart';

class Enrollment extends Equatable {
  final String id;
  final String courseId;
  final String accountId;
  final DateTime createdAt;

  const Enrollment({
    required this.id,
    required this.courseId,
    required this.accountId,
    required this.createdAt,
  });

  Enrollment copyWith({
    String? id,
    String? courseId,
    String? accountId,
    DateTime? createdAt,
  }) {
    return Enrollment(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      accountId: accountId ?? this.accountId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object> get props => [id, courseId, accountId, createdAt];
}
