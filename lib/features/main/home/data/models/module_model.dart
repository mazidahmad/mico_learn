import 'dart:convert';

import 'package:mico_learn/features/main/home/data/models/lesson_model.dart';
import 'package:mico_learn/features/main/home/domain/entities/module.dart';

class ModuleModel extends Module {
  const ModuleModel({
    required super.id,
    required super.courseId,
    required super.title,
    required super.createdAt,
    required super.sequenceNumber,
    super.description,
    super.lessons,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'course_id': courseId,
      'title': title,
      'sequence_number': sequenceNumber,
      'description': description,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ModuleModel.fromMap(Map<String, dynamic> map) {
    return ModuleModel(
      id: map['id'] as String,
      courseId: map['course_id'] as String,
      title: map['title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      createdAt: DateTime.parse(map['created_at'] as String),
      lessons: map['lesson'] != null
          ? List.from(map['lesson'])
              .map((data) => LessonModel.fromMap(data))
              .toList()
          : null,
      sequenceNumber: map['sequence_number'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModuleModel.fromJson(String source) =>
      ModuleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
