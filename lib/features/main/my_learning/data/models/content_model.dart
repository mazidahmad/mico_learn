import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/data/models/contents/infographic_content_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/contents/slide_content_model.dart';

import '../../domain/entities/content.dart';
import 'contents/video_content_model.dart';

class ContentModel extends Content {
  const ContentModel({
    required super.id,
    required super.createdAt,
    required super.type,
    required super.value,
    required super.lessonId,
    required super.sequence,
    super.title,
  });

  factory ContentModel.fromMap(Map<String, dynamic> map) {
    String type = map['type'];
    dynamic value;

    switch (type) {
      case 'infographic':
        var jsonValue = jsonDecode(map['value']);
        var data = jsonDecode(jsonValue);
        value = InfographicContentModel(imageUrl: data['data']);
      case 'video':
        var jsonValue = jsonDecode(map['value']);
        value = VideoContentModel.fromJson(jsonValue);
        break;
      case 'insight':
        var jsonValue = jsonDecode(map['value']);
        var data = jsonDecode(jsonValue);
        value =
            SlideContentModel.fromMap(data.cast<Map<String, dynamic>>()).datas;
        break;
      case 'slide':
        var jsonValue = jsonDecode(map['value']);
        var data = jsonDecode(jsonValue) as List;
        value = SlideContentModel.fromMap(data.cast<Map<String, dynamic>>());
        break;
      case 'assessment':
      case 'quiz':
      default:
        value = map['value'];
    }

    return ContentModel(
      id: map['id'] as String,
      createdAt: DateTime.parse(map['created_at']),
      title: map['title'] != null ? map['title'] as String : null,
      type: map['type'] as String,
      value: value,
      lessonId: map['lesson_id'] as String,
      sequence: map['sequence'] as int,
    );
  }

  factory ContentModel.fromJson(String source) =>
      ContentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
