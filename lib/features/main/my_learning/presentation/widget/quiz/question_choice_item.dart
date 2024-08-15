import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/choice.dart';

class QuestionChoiceItem extends StatelessWidget {
  const QuestionChoiceItem({
    super.key,
    this.isSelected = false,
    required this.choice,
    required this.onTap,
    this.isCorrect,
  });

  final Choice choice;
  final bool? isCorrect;
  final bool isSelected;
  final void Function(String choiceId) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(choice.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.secondary,
          border: isCorrect == true
              ? Border.all(width: 3, color: AppColors.success)
              : isSelected
                  ? Border.all(
                      width: 3,
                      color: AppColors.primary,
                      strokeAlign: BorderSide.strokeAlignInside)
                  : null,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                choice.option,
                style:
                    AppTextStyle.headlineExtraSmall(color: AppColors.primary),
              ),
            ),
            const Gap(19),
            if (choice.type == "image")
              CachedNetworkImage(
                imageUrl: choice.value,
                width: 200,
              ),
            if (choice.type == "text")
              Expanded(
                child: Text(
                  choice.value,
                  style: AppTextStyle.labelMedium(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
