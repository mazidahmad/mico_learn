import 'dart:convert';

import 'package:mico_learn/features/main/home/data/models/course_model.dart';
import 'package:mico_learn/features/main/home/data/models/enrollment_model.dart';
import 'package:mico_learn/features/main/home/data/models/module_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/enrollment_lesson_model.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/learning_detail.dart';

class LearningDetailModel extends LearningDetail {
  const LearningDetailModel(
      {required super.enrollment,
      required super.course,
      required super.modules,
      required super.enrollmentLessons});

  factory LearningDetailModel.fromMap(Map<String, dynamic> map) {
    return LearningDetailModel(
      enrollment:
          EnrollmentModel.fromMap(map['enrollment'] as Map<String, dynamic>),
      course: CourseModel.fromMap(map['course'] as Map<String, dynamic>),
      modules: List<ModuleModel>.from(
        (map['modules'] as List<int>).map<ModuleModel>(
          (x) => ModuleModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      enrollmentLessons: List<EnrollmentLessonModel>.from(
        (map['enrollmentLessons'] as List<int>).map<EnrollmentLessonModel>(
          (x) => EnrollmentLessonModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory LearningDetailModel.fromJson(String source) =>
      LearningDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
