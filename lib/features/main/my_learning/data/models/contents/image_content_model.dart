import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/contents/image_content.dart';

class ImageContentModel extends ImageContent {
  const ImageContentModel({required super.url, super.height, super.width});

  factory ImageContentModel.fromMap(Map<String, dynamic> map) {
    return ImageContentModel(
      url: map['url'] as String,
      height: map['height'],
      width: map['width'],
    );
  }

  factory ImageContentModel.fromJson(String source) =>
      ImageContentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
