import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/question.dart';

class QuestionSequenceHeader extends StatelessWidget {
  const QuestionSequenceHeader({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Soal",
            textAlign: TextAlign.justify,
            style: AppTextStyle.labelMedium(color: AppColors.bodyOnPrimary),
          ),
          const Gap(12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              question.sequence.toString(),
              style: AppTextStyle.headlineExtraSmall(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
