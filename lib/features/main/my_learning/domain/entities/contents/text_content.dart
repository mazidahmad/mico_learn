import 'package:equatable/equatable.dart';

class TextContent extends Equatable {
  final String text;
  const TextContent({
    required this.text,
  });

  TextContent copyWith({
    String? text,
  }) {
    return TextContent(
      text: text ?? this.text,
    );
  }

  @override
  List<Object> get props => [text];
}
