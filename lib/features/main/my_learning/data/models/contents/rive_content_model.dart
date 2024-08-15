import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/contents/rive_content.dart';

class RiveContentModel extends RiveContent {
  const RiveContentModel({
    required super.url,
    required super.width,
    required super.height,
    required super.artboard,
  });

  factory RiveContentModel.fromMap(Map<String, dynamic> map) {
    return RiveContentModel(
      url: map['url'] as String,
      artboard: map['artboard'],
      height: map['height'],
      width: map['width'],
    );
  }

  factory RiveContentModel.fromJson(String source) =>
      RiveContentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
