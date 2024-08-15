import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/mixin/messager_mixin.dart';
import 'package:mico_learn/features/main/home/presentation/widgets/learning_module_item.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../my_learning/domain/entities/enrollment_lesson.dart';
import '../../../my_learning/presentation/cubit/learning_detail_cubit.dart';
import '../../domain/entities/module.dart';

class LearningLessonWidget extends StatefulWidget {
  const LearningLessonWidget({
    super.key,
    required this.modules,
    required this.lessons,
    required this.onComplete,
    required this.learningDetailCubit,
  });

  final List<Module> modules;
  final List<EnrollmentLesson> lessons;
  final void Function() onComplete;
  final LearningDetailCubit learningDetailCubit;

  @override
  State<LearningLessonWidget> createState() => _LearningLessonWidgetState();
}

class _LearningLessonWidgetState extends State<LearningLessonWidget>
    with MessagerMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Bahasan',
              style: AppTextStyle.headlineExtraSmall(),
            ),
            const Spacer(),
            Text(
              '${widget.modules.length}',
              style: AppTextStyle.labelMedium(color: AppColors.bodySecondary),
            ),
          ],
        ),
        const Gap(9),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.modules.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                LearningModuleItem(
                  learningDetailCubit: widget.learningDetailCubit,
                  module: widget.modules[index],
                  isLocked: (index > 0 &&
                      !widget.lessons
                          .where((element) =>
                              element.moduleId == widget.modules[index - 1].id)
                          .every((element) => element.isCompleted)),
                  lessons: widget.lessons
                      .where((element) =>
                          element.moduleId == widget.modules[index].id)
                      .toList(),
                  onComplete: widget.onComplete,
                ),
                const Gap(10),
              ],
            );
          },
        )
      ],
    );
  }
}
