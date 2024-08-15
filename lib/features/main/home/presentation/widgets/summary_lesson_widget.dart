import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/mixin/messager_mixin.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/features/main/home/presentation/cubit/summary_course_cubit.dart';
import 'package:mico_learn/features/main/home/presentation/widgets/lesson_score_item.dart';

import '../../../my_learning/domain/entities/enrollment_lesson.dart';
import '../../domain/entities/module.dart';

class SummaryLessonWidget extends StatefulWidget {
  const SummaryLessonWidget(
      {super.key,
      required this.enrollmentId,
      required this.modules,
      required this.lessons});

  final String enrollmentId;
  final List<Module> modules;
  final List<EnrollmentLesson> lessons;

  @override
  State<SummaryLessonWidget> createState() => _SummaryLessonWidgetState();
}

class _SummaryLessonWidgetState extends State<SummaryLessonWidget>
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
    return BlocConsumer<SummaryCourseCubit, SummaryCourseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SummaryCourseLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.modules.length,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        LearningModuleScoreItem(
                          quizScores: state.quisScores,
                          module: widget.modules[index],
                          isLocked: (index > 0 &&
                              !widget.lessons
                                  .where((element) =>
                                      element.moduleId ==
                                      widget.modules[index - 1].id)
                                  .every((element) => element.isCompleted)),
                          lessons: widget.lessons
                              .where((element) =>
                                  element.moduleId == widget.modules[index].id)
                              .toList(),
                          onComplete: () {},
                        ),
                        const Gap(10),
                      ],
                    );
                  },
                ),
                Text(
                  '* Nilai yang tertera merupakan pengerjaan pertama kali',
                  style: AppTextStyle.bodySmall(),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
