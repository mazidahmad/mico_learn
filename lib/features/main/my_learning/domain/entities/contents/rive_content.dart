import 'package:equatable/equatable.dart';

class RiveContent extends Equatable {
  final String url;
  final int width;
  final int height;
  final String artboard;

  const RiveContent({
    required this.url,
    required this.height,
    required this.width,
    required this.artboard,
  });

  RiveContent copyWith({
    String? url,
    int? width,
    int? height,
    String? artboard,
  }) {
    return RiveContent(
      url: url ?? this.url,
      height: height ?? this.height,
      width: width ?? this.width,
      artboard: artboard ?? this.artboard,
    );
  }

  @override
  List<Object> get props => [url, width, height, artboard];
}
