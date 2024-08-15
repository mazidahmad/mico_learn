import 'dart:convert';

import 'package:mico_learn/features/main/home/domain/entities/lesson.dart';

class LessonModel extends Lesson {
  const LessonModel({
    required super.id,
    required super.title,
    super.category,
    required super.moduleId,
    required super.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'category': category,
      'module_id': moduleId,
      'created_at': createdAt.toIso8601String()
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    return LessonModel(
      id: map['id'] as String,
      title: map['title'] as String,
      category: map['category'] as String?,
      moduleId: map['module_id'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonModel.fromJson(String source) =>
      LessonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
