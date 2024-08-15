import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/contents/text_content.dart';

class TextContentModel extends TextContent {
  const TextContentModel({required super.text});

  factory TextContentModel.fromMap(Map<String, dynamic> map) {
    return TextContentModel(
      text: map['text'] as String,
    );
  }

  factory TextContentModel.fromJson(String source) =>
      TextContentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
