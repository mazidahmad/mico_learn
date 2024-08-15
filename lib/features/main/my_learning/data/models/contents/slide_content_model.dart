import 'package:mico_learn/features/main/my_learning/data/models/contents/image_content_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/contents/rive_content_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/contents/text_content_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/contents/text_header_content_model.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/contents/slide_content.dart';

class SlideContentModel extends SlideContent {
  const SlideContentModel({required super.datas});

  factory SlideContentModel.fromMap(List<Map<String, dynamic>> listMap) {
    return SlideContentModel(
      datas: List<dynamic>.from(
        (listMap).map((map) {
          switch (map['type']) {
            case 'image':
              return ImageContentModel.fromMap(map['data']);
            case 'rive':
              return RiveContentModel.fromMap(map['data']);
            case 'header':
              return TextHeaderContentModel(title: map['data']);
            default:
              return TextContentModel(text: map['data']);
          }
        }),
      ),
    );
  }

  @override
  bool get stringify => true;
}
