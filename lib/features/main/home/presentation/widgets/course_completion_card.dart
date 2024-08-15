import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CourseCompletionCard extends StatelessWidget {
  const CourseCompletionCard({
    super.key,
    required this.courseName,
    required this.sectionCount,
    required this.lessonCount,
    required this.courseImage,
    required this.percentage,
    required this.onTap,
  });

  final String courseName;
  final int sectionCount;
  final int lessonCount;
  final String courseImage;
  final double percentage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: courseImage,
                width: 71,
                height: 71,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: AppTextStyle.labelMedium(),
                  ),
                  const Gap(13),
                  Row(
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          minHeight: 11,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: AppColors.primary,
                          backgroundColor: AppColors.background,
                          value: (percentage / 100),
                        ),
                      ),
                      const Gap(7),
                      Text(
                        '${percentage.toInt()}%',
                        style:
                            AppTextStyle.labelSmall(color: AppColors.primary),
                      ),
                      const Gap(5)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
