import 'dart:convert';

import '../../../domain/entities/contents/text_header_content.dart';

class TextHeaderContentModel extends TextHeaderContent {
  const TextHeaderContentModel({required super.title});

  factory TextHeaderContentModel.fromMap(Map<String, dynamic> map) {
    return TextHeaderContentModel(
      title: map['text'] as String,
    );
  }

  factory TextHeaderContentModel.fromJson(String source) =>
      TextHeaderContentModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
