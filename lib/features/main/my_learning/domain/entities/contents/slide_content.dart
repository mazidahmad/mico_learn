import 'package:equatable/equatable.dart';

class SlideContent extends Equatable {
  final List<dynamic> datas;

  const SlideContent({
    required this.datas,
  });

  SlideContent copyWith({
    List<dynamic>? datas,
  }) {
    return SlideContent(
      datas: datas ?? this.datas,
    );
  }

  @override
  List<Object> get props => [datas];
}
