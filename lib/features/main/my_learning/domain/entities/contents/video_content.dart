import 'package:equatable/equatable.dart';

class VideoContent extends Equatable {
  final String title;
  final String videoUrl;

  const VideoContent({
    required this.title,
    required this.videoUrl,
  });

  VideoContent copyWith({
    String? title,
    String? videoUrl,
  }) {
    return VideoContent(
      title: title ?? this.title,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  @override
  List<Object> get props => [title, videoUrl];
}
