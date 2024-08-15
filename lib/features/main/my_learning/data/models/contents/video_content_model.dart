import 'dart:convert';

import 'package:mico_learn/features/main/my_learning/domain/entities/contents/video_content.dart';

class VideoContentModel extends VideoContent {
  const VideoContentModel({required super.title, required super.videoUrl});

  factory VideoContentModel.fromMap(Map<String, dynamic> map) {
    return VideoContentModel(
      title: map['title'] as String,
      videoUrl: map['video_url'] as String,
    );
  }

  factory VideoContentModel.fromJson(String source) =>
      VideoContentModel.fromMap(jsonDecode(source));

  @override
  bool get stringify => true;
}
