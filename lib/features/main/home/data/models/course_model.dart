import 'dart:convert';

import 'package:mico_learn/features/main/home/data/models/module_model.dart';
import 'package:mico_learn/features/main/home/domain/entities/course.dart';

class CourseModel extends Course {
  const CourseModel({
    required super.id,
    required super.name,
    super.bannerImage,
    super.description,
    required super.createdAt,
    super.modules,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'banner_image': bannerImage,
      'description': description,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
        id: map['id'] as String,
        name: map['name'] as String,
        bannerImage: map['banner_image'] as String?,
        description: map['description'] as String,
        createdAt: DateTime.parse(map['created_at'] as String),
        modules: map['module'] != null
            ? List.from(map['module'])
                .map((e) => ModuleModel.fromMap(e))
                .toList()
            : null);
  }

  String toJson() => json.encode(toMap());

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
