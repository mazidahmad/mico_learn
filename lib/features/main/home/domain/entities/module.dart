import 'package:equatable/equatable.dart';
import 'package:mico_learn/features/main/home/domain/entities/lesson.dart';

class Module extends Equatable {
  final String id;
  final String courseId;
  final String title;
  final int sequenceNumber;
  final String? description;
  final DateTime createdAt;
  final List<Lesson>? lessons;

  const Module({
    required this.id,
    required this.courseId,
    required this.title,
    required this.sequenceNumber,
    this.description,
    required this.createdAt,
    this.lessons,
  });

  Module copyWith({
    String? id,
    String? courseId,
    String? title,
    int? sequenceNumber,
    String? description,
    DateTime? createdAt,
    List<Lesson>? lessons,
  }) {
    return Module(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      sequenceNumber: sequenceNumber ?? this.sequenceNumber,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      lessons: lessons ?? this.lessons,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      courseId,
      title,
      sequenceNumber,
      description,
      createdAt,
      lessons,
    ];
  }
}
