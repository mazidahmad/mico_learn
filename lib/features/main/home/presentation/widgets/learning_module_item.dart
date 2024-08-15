import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/features/main/home/domain/entities/module.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/enrollment_lesson.dart';
import 'package:mico_learn/features/startup/presentation/cubit/account_cubit.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../routes/app_router.dart';
import '../../../../../routes/app_router.gr.dart';
import '../../../../auth/domain/entities/account.dart';
import '../../../my_learning/presentation/cubit/learning_detail_cubit.dart';

class LearningModuleItem extends StatelessWidget {
  const LearningModuleItem({
    super.key,
    required this.module,
    required this.lessons,
    required this.isLocked,
    required this.onComplete,
    required this.learningDetailCubit,
  });

  final Module module;
  final List<EnrollmentLesson> lessons;
  final bool isLocked;
  final void Function() onComplete;
  final LearningDetailCubit learningDetailCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            itemCount: lessons.length,
            itemBuilder: (context, index) =>
                BlocBuilder<AccountCubit, Account?>(
              bloc: getIt<AccountCubit>(),
              builder: (context, account) {
                return LearningLessonItem(
                  title: (account?.isVip == true)
                      ? lessons[index].title
                      : "Quiz : ${lessons[index].title}",
                  category: lessons[index].category,
                  // For Debug
                  // isLocked: false,
                  isLocked: isLocked ||
                      (index > 0 && !lessons[index - 1].isCompleted),
                  isCompleted: lessons[index].isCompleted,
                  onTap: () async {
                    await getIt<AppRouter>().push(
                      LearningRoute(
                          learningDetailCubit: learningDetailCubit,
                          lessonId: lessons[index].id,
                          enrollmentId: lessons[index].enrollmentId),
                    );

                    onComplete.call();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class LearningLessonItem extends StatelessWidget {
  const LearningLessonItem({
    required this.title,
    required this.onTap,
    this.category,
    this.isLocked = true,
    this.isCompleted = false,
    super.key,
  });

  final String title;
  final String? category;
  final bool isLocked;
  final bool isCompleted;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLocked ? null : onTap,
      child: Container(
        color: AppColors.background,
        child: Column(
          children: [
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                children: [
                  const Gap(10),
                  FaIcon(
                    FontAwesomeIcons.bookOpen,
                    color: isLocked ? AppColors.secondary : AppColors.primary,
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
                          style: AppTextStyle.labelSmall(
                              color: isLocked
                                  ? AppColors.bodySecondary
                                  : AppColors.bodyPrimary),
                        ),
                      ],
                    ),
                  ),
                  const Gap(23),
                  if (isLocked)
                    const FaIcon(
                      FontAwesomeIcons.lock,
                      color: AppColors.bodySecondary,
                      size: 18,
                    ),
                  if (!isLocked)
                    FaIcon(
                      isCompleted
                          ? FontAwesomeIcons.check
                          : FontAwesomeIcons.chevronRight,
                      color: AppColors.primary,
                      size: 18,
                    ),
                  const Gap(12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
