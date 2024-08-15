import 'package:equatable/equatable.dart';

class Assessment extends Equatable {
  final String id;
  final DateTime createdAt;
  final String lessonId;
  final String type;
  final dynamic value;

  const Assessment({
    required this.id,
    required this.createdAt,
    required this.lessonId,
    required this.type,
    required this.value,
  });

  Assessment copyWith({
    String? id,
    DateTime? createdAt,
    String? lessonId,
    String? type,
    dynamic value,
  }) {
    return Assessment(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      lessonId: lessonId ?? this.lessonId,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      createdAt,
      lessonId,
      type,
      value,
    ];
  }
}
