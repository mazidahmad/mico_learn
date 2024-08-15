import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../domain/entities/question.dart';
import 'question_sequence_header.dart';

class QuestionEvaluationHeader extends StatelessWidget {
  const QuestionEvaluationHeader({
    super.key,
    required this.question,
    required this.choiceAnswerId,
  });

  final Question question;
  final String choiceAnswerId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        QuestionSequenceHeader(question: question),
        const Gap(12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: choiceAnswerId == question.answer.choiceId
                ? AppColors.success
                : AppColors.failed,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            (choiceAnswerId == question.answer.choiceId) ? 'Benar' : 'Salah',
            style: AppTextStyle.labelMedium(color: AppColors.bodyOnPrimary),
          ),
        ),
        const Gap(8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${choiceAnswerId == question.answer.choiceId ? 100 : 0} poin',
            style: AppTextStyle.labelSmall(),
          ),
        )
      ],
    );
  }
}
