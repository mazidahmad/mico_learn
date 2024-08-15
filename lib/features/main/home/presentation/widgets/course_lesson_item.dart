import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/features/main/home/domain/entities/module.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CourseModuleItem extends StatelessWidget {
  const CourseModuleItem({
    super.key,
    required this.module,
    required this.onTap,
  });

  final Module module;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.secondary,
            width: 2,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.primary,
                    ),
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.bookOpen,
                        color: AppColors.background,
                        size: 20,
                      ),
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: Text(
                      module.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.labelMedium(color: AppColors.primary),
                    ),
                  ),
                  Text(
                    '${module.lessons?.length ?? '1'} Sesi',
                    style:
                        AppTextStyle.labelSmall(color: AppColors.bodySecondary),
                  )
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: module.lessons?.length,
              itemBuilder: (context, index) => LessonModuleItem(
                title: module.lessons![index].title,
                category: module.lessons![index].category,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LessonModuleItem extends StatelessWidget {
  const LessonModuleItem({
    required this.title,
    this.category,
    super.key,
  });

  final String title;
  final String? category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              const Gap(10),
              const FaIcon(
                FontAwesomeIcons.bookOpen,
                color: AppColors.primary,
                size: 18,
              ),
              const Gap(23),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (category != null)
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.secondary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              category!,
                              style: AppTextStyle.labelExtraSmall(
                                  color: AppColors.primary),
                            ),
                          ),
                          const Gap(4),
                        ],
                      ),
                    Text(
                      title,
                      style: AppTextStyle.labelSmall(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
