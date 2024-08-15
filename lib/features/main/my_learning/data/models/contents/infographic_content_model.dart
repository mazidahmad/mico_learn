import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/contents/infographic_content.dart';

class InfographicContentModel extends InfographicContent {
  const InfographicContentModel({required super.imageUrl});

  factory InfographicContentModel.fromMap(Map<String, dynamic> map) {
    return InfographicContentModel(
      imageUrl: map['imageUrl'] as String,
    );
  }

  factory InfographicContentModel.fromJson(String source) =>
      InfographicContentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
