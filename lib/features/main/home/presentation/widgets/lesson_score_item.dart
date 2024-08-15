import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/extensions/date_extension.dart';
import 'package:mico_learn/core/utils/learning_util.dart';
import 'package:mico_learn/features/main/home/domain/entities/module.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/enrollment_lesson.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/lesson_quiz_score.dart';
import 'package:mico_learn/features/startup/presentation/cubit/account_cubit.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../routes/app_router.dart';
import '../../../../../routes/app_router.gr.dart';
import '../../../../auth/domain/entities/account.dart';

class LearningModuleScoreItem extends StatelessWidget {
  const LearningModuleScoreItem({
    super.key,
    required this.module,
    required this.lessons,
    required this.isLocked,
    required this.onComplete,
    required this.quizScores,
  });

  final Module module;
  final List<EnrollmentLesson> lessons;
  final List<LessonQuizScore> quizScores;
  final bool isLocked;
  final void Function() onComplete;

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
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.primary,
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.bookOpen,
                      color: AppColors.background,
                      size: 10,
                    ),
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: Text(
                    module.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.labelSmall(color: AppColors.primary),
                  ),
                ),
                Text(
                  'Nilai : ',
                  style:
                      AppTextStyle.labelSmall(color: AppColors.bodySecondary),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.primaryAlt,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    LearningUtil.calculateTotalScores(quizScores
                        .where((scores) => lessons
                            .any((lesson) => lesson.id == scores.lessonId))
                        .map((e) => e.score)
                        .toList()),
                    style: AppTextStyle.labelExtraSmall(
                        color: AppColors.bodyOnPrimary),
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lessons.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) =>
                BlocBuilder<AccountCubit, Account?>(
              bloc: getIt<AccountCubit>(),
              builder: (context, account) {
                return LearningLessonScoreItem(
                  title: (account?.isVip == true)
                      ? lessons[index].title
                      : "Quiz : ${lessons[index].title}",
                  category: lessons[index].category,
                  // For Debug
                  // isLocked: false,
                  isLocked: isLocked ||
                      (index > 0 && !lessons[index - 1].isCompleted),
                  isCompleted: lessons[index].isCompleted,
                  score: (quizScores
                              .where((element) =>
                                  element.lessonId == lessons[index].id)
                              .firstOrNull
                              ?.score ??
                          0) *
                      100,
                  onTap: () async {
                    getIt<AppRouter>().push(HistoryLearningRoute(
                        lessonId: lessons[index].id,
                        lessonTitle: lessons[index].title,
                        enrollmentId: lessons[index].enrollmentId));
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

class LearningLessonScoreItem extends StatelessWidget {
  const LearningLessonScoreItem({
    required this.title,
    required this.onTap,
    this.category,
    this.isLocked = true,
    this.isCompleted = false,
    this.score,
    super.key,
  });

  final String title;
  final String? category;
  final bool isLocked;
  final bool isCompleted;
  final int? score;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLocked || !isCompleted ? null : onTap,
      child: Container(
        color: AppColors.background,
        child: Column(
          children: [
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  const Gap(5),
                  FaIcon(
                    FontAwesomeIcons.bookOpen,
                    color: isLocked ? AppColors.secondary : AppColors.primary,
                    size: 15,
                  ),
                  const Gap(15),
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
                  if (!isLocked && isCompleted)
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.primaryAlt,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "$score",
                            style: AppTextStyle.labelExtraSmall(
                                color: AppColors.bodyOnPrimary),
                          ),
                        ),
                        const Gap(15),
                        const FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: AppColors.primary,
                          size: 18,
                        )
                      ],
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

class LearningLessonHistoryItem extends StatelessWidget {
  const LearningLessonHistoryItem({
    required this.title,
    required this.onTap,
    required this.score,
    required this.doDate,
    super.key,
  });

  final String title;
  final int score;
  final DateTime doDate;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.background,
        child: Column(
          children: [
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  const Gap(5),
                  const FaIcon(
                    FontAwesomeIcons.bookOpen,
                    color: AppColors.primary,
                    size: 15,
                  ),
                  const Gap(15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyle.labelSmall(
                              color: AppColors.bodyPrimary),
                        ),
                        Text(
                          doDate.toFormattedDate(),
                          style: AppTextStyle.bodySmall(
                              color: AppColors.bodySecondary),
                        ),
                      ],
                    ),
                  ),
                  const Gap(23),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.primaryAlt,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "$score",
                          style: AppTextStyle.labelExtraSmall(
                              color: AppColors.bodyOnPrimary),
                        ),
                      ),
                      const Gap(15),
                      const FaIcon(
                        FontAwesomeIcons.chevronRight,
                        color: AppColors.primary,
                        size: 18,
                      )
                    ],
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
