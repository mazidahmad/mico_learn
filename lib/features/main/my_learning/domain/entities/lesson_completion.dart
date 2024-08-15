import 'package:equatable/equatable.dart';

class LessonCompletion extends Equatable {
  final String id;
  final String name;
  final bool isCompleted;

  const LessonCompletion({
    required this.id,
    required this.name,
    required this.isCompleted,
  });

  LessonCompletion copyWith({
    String? id,
    String? name,
    bool? isCompleted,
  }) {
    return LessonCompletion(
      id: id ?? this.id,
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object> get props => [id, name, isCompleted];
}
