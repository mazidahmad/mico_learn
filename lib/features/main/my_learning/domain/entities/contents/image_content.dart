import 'package:equatable/equatable.dart';

class ImageContent extends Equatable {
  final double? width;
  final double? height;
  final String url;

  const ImageContent({
    required this.url,
    this.height,
    this.width,
  });

  ImageContent copyWith({
    String? url,
    double? width,
    double? height,
  }) {
    return ImageContent(
      url: url ?? this.url,
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }

  @override
  List<Object?> get props => [height, width, url];
}
