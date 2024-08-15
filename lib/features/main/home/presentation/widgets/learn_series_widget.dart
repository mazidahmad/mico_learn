import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'learn_series_item.dart';

class LearnSeriesWidget extends StatelessWidget {
  const LearnSeriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const Gap(80),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.calendar,
                              size: 12,
                            ),
                            const Gap(6),
                            Text(
                              '24',
                              style: AppTextStyle.labelMedium(
                                  color: AppColors.primary),
                            ),
                            const Gap(6),
                            Text(
                              'Hari',
                              style: AppTextStyle.labelSmall(),
                            )
                          ],
                        ),
                      ),
                      const Gap(8),
                      Text(
                        'Aktif Belajar',
                        style: AppTextStyle.labelSmall(
                            color: AppColors.bodyOnPrimary),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryAlt,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(
                'Runtutan Belajar',
                style: AppTextStyle.labelMedium(color: AppColors.bodyOnPrimary),
              ),
              const Gap(13),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LearnSeriesItem(
                      label: 'Sen', status: LearnSeriesStatus.check),
                  LearnSeriesItem(
                      label: 'Sel', status: LearnSeriesStatus.check),
                  LearnSeriesItem(
                      label: 'Rab', status: LearnSeriesStatus.doing),
                  LearnSeriesItem(
                      label: 'Kam', status: LearnSeriesStatus.empty),
                  LearnSeriesItem(
                      label: 'Jum', status: LearnSeriesStatus.empty),
                  LearnSeriesItem(
                      label: 'Sab', status: LearnSeriesStatus.empty),
                  LearnSeriesItem(label: 'Min', status: LearnSeriesStatus.empty)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
