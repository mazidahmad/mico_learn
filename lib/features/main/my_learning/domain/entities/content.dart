import 'package:equatable/equatable.dart';
import 'package:mico_learn/features/main/my_learning/data/models/content_model.dart';

class Content extends Equatable {
  final String id;
  final DateTime createdAt;
  final String? title;
  final String type;
  final dynamic value;
  final String lessonId;
  final int sequence;

  const Content({
    required this.id,
    required this.createdAt,
    this.title,
    required this.type,
    required this.value,
    required this.lessonId,
    required this.sequence,
  });

  Content copyWith({
    String? id,
    DateTime? createdAt,
    String? title,
    String? type,
    dynamic value,
    String? lessonId,
    int? sequence,
  }) {
    return Content(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      type: type ?? this.type,
      value: value ?? this.value,
      lessonId: lessonId ?? this.lessonId,
      sequence: sequence ?? this.sequence,
    );
  }

  ContentModel toModel() => ContentModel(
      id: id,
      createdAt: createdAt,
      type: type,
      value: value,
      lessonId: lessonId,
      sequence: sequence,
      title: title);

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      title,
      type,
      value,
      lessonId,
      sequence,
    ];
  }
}
