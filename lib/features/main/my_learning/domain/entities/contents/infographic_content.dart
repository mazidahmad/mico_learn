import 'package:equatable/equatable.dart';

class InfographicContent extends Equatable {
  final String imageUrl;

  const InfographicContent({
    required this.imageUrl,
  });

  InfographicContent copyWith({
    String? imageUrl,
  }) {
    return InfographicContent(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object> get props => [imageUrl];
}
