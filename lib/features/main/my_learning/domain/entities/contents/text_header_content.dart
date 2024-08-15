import 'package:equatable/equatable.dart';

class TextHeaderContent extends Equatable {
  final String title;
  const TextHeaderContent({
    required this.title,
  });

  TextHeaderContent copyWith({
    String? title,
  }) {
    return TextHeaderContent(
      title: title ?? this.title,
    );
  }

  @override
  List<Object> get props => [title];
}
