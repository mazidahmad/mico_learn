import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_asset.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CourseDetailHeader extends StatelessWidget {
  const CourseDetailHeader({
    super.key,
    required this.sectionCount,
    required this.lessonCount,
    required this.courseImage,
  });

  final int sectionCount;
  final int lessonCount;
  final String courseImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: courseImage,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAsset.iconBox),
                  const Gap(9),
                  Text(
                    '$sectionCount Materi',
                    style:
                        AppTextStyle.titleExtraSmall(color: AppColors.primary),
                  )
                ],
              ),
              const Gap(14),
              Row(
                children: [
                  SvgPicture.asset(AppAsset.iconViewGrid),
                  const Gap(9),
                  Text(
                    '$lessonCount Bahasan',
                    style:
                        AppTextStyle.titleExtraSmall(color: AppColors.primary),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
