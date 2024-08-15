import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

enum LearnSeriesStatus { check, skip, doing, empty }

class LearnSeriesItem extends StatelessWidget {
  const LearnSeriesItem({super.key, required this.label, required this.status});

  final String label;
  final LearnSeriesStatus status;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: status == LearnSeriesStatus.doing
                ? AppColors.primary
                : AppColors.background,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: status == LearnSeriesStatus.check
                  ? AppColors.success
                  : status == LearnSeriesStatus.doing ||
                          status == LearnSeriesStatus.empty
                      ? AppColors.background
                      : AppColors.secondary,
              borderRadius: BorderRadius.circular(28),
            ),
            child: status != LearnSeriesStatus.doing ||
                    status != LearnSeriesStatus.empty
                ? Center(
                    child: FaIcon(
                      status == LearnSeriesStatus.check
                          ? FontAwesomeIcons.check
                          : FontAwesomeIcons.cross,
                      size: 12,
                      color: AppColors.background,
                    ),
                  )
                : null,
          ),
        ),
        const Gap(1),
        Text(
          label,
          style: AppTextStyle.labelSmall(color: AppColors.bodyOnPrimary),
        ),
      ],
    );
  }
}
