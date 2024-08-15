import 'package:equatable/equatable.dart';

class Choice extends Equatable {
  final String id;
  final DateTime createdAt;
  final String option;
  final dynamic value;
  final String questionId;
  final String type;

  const Choice({
    required this.id,
    required this.createdAt,
    required this.option,
    required this.value,
    required this.questionId,
    required this.type,
  });

  Choice copyWith({
    String? id,
    DateTime? createdAt,
    String? option,
    dynamic value,
    String? questionId,
    String? type,
  }) {
    return Choice(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      option: option ?? this.option,
      value: value ?? this.value,
      questionId: questionId ?? this.questionId,
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      createdAt,
      option,
      value,
      questionId,
      type,
    ];
  }
}
