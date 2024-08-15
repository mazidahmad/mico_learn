import 'package:equatable/equatable.dart';
import 'package:mico_learn/features/main/home/domain/entities/module.dart';

class Course extends Equatable {
  final String id;
  final String name;
  final String? bannerImage;
  final String? description;
  final DateTime createdAt;
  final List<Module>? modules;

  const Course({
    required this.id,
    required this.name,
    required this.bannerImage,
    required this.description,
    required this.createdAt,
    this.modules,
  });

  Course copyWith({
    String? id,
    String? name,
    String? bannerImage,
    String? description,
    DateTime? createdAt,
    List<Module>? modules,
    int? totalLessons,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      bannerImage: bannerImage ?? this.bannerImage,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      modules: modules ?? this.modules,
    );
  }

  int get totalLesson {
    var count = 0;
    modules?.forEach((element) {
      count += element.lessons?.length ?? 0;
    });

    return count;
  }

  @override
  List<Object?> get props {
    return [id, name, bannerImage, description, createdAt, modules];
  }
}
