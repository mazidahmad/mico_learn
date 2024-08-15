import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_asset.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.courseName,
    required this.sectionCount,
    required this.lessonCount,
    required this.courseImage,
    required this.onTap,
  });

  final String courseName;
  final int sectionCount;
  final int lessonCount;
  final String courseImage;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: courseImage,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: AppTextStyle.labelMedium(),
                  ),
                  const Gap(7),
                  Row(
                    children: [
                      SvgPicture.asset(AppAsset.iconBox),
                      const Gap(9),
                      Text(
                        '$sectionCount',
                        style: AppTextStyle.titleExtraSmall(
                            color: AppColors.primary),
                      ),
                      const Gap(12),
                      SvgPicture.asset(AppAsset.iconViewGrid),
                      const Gap(9),
                      Text(
                        '$lessonCount',
                        style: AppTextStyle.titleExtraSmall(
                            color: AppColors.primary),
                      )
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
