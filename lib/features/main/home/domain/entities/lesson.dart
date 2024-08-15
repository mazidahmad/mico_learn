import 'package:equatable/equatable.dart';

class Lesson extends Equatable {
  final String id;
  final String title;
  final String? category;
  final String moduleId;
  final DateTime createdAt;

  const Lesson({
    required this.id,
    required this.title,
    this.category,
    required this.moduleId,
    required this.createdAt,
  });

  Lesson copyWith({
    String? id,
    String? title,
    String? category,
    String? moduleId,
    DateTime? createdAt,
  }) {
    return Lesson(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      moduleId: moduleId ?? this.moduleId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, title, category, moduleId, createdAt];
}
