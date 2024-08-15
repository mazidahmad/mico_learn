import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/mixin/messager_mixin.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';
import 'package:mico_learn/features/main/home/presentation/widgets/course_detail_header.dart';
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_detail_cubit.dart';
import 'package:mico_learn/routes/app_router.dart';
import 'package:mico_learn/routes/app_router.gr.dart';

import '../../../home/presentation/widgets/course_detail_description.dart';
import '../../../home/presentation/widgets/learning_lesson_widget.dart';

@RoutePage()
class LearningDetailPage extends StatefulWidget {
  const LearningDetailPage(
      {super.key, required this.enrollmentId, required this.onComplete});

  static const String routeName = '/learning-detail';

  final String enrollmentId;
  final void Function() onComplete;

  @override
  State<LearningDetailPage> createState() => _LearningDetailPageState();
}

class _LearningDetailPageState extends State<LearningDetailPage>
    with MessagerMixin {
  late LearningDetailCubit _learningDetailCubit;

  @override
  void initState() {
    _learningDetailCubit = getIt<LearningDetailCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _learningDetailCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          _learningDetailCubit..getUserLearningDetail(widget.enrollmentId),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Detail Pelajaranku',
            style: AppTextStyle.headlineExtraSmall(),
          ),
          actions: [
            IconButton(
              onPressed: () => getIt<AppRouter>().push(SummaryLearningRoute(
                  learningDetail:
                      (_learningDetailCubit.state as LearningDetailLoaded)
                          .learningDetail)),
              icon: const Icon(
                Icons.bar_chart_rounded,
              ),
            )
          ],
        ),
        body: BlocConsumer<LearningDetailCubit, LearningDetailState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LearningDetailLoading) {
              return const Center(child: AppLoading());
            }
            if (state is LearningDetailLoaded) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Column(
                      children: [
                        CourseDetailHeader(
                          sectionCount: state.learningDetail.modules.length,
                          lessonCount:
                              state.learningDetail.enrollmentLessons.length,
                          courseImage:
                              state.learningDetail.course.bannerImage ?? '-',
                        ),
                        const Gap(12),
                        CourseDetailDescription(
                          courseName: state.learningDetail.course.name,
                          courseDescription:
                              state.learningDetail.course.description ?? '-',
                        ),
                        const Gap(17),
                        LearningLessonWidget(
                          learningDetailCubit: _learningDetailCubit,
                          modules: state.learningDetail.modules,
                          lessons: state.learningDetail.enrollmentLessons,
                          onComplete: () {
                            _learningDetailCubit
                                .getUserLearningDetail(widget.enrollmentId);
                            widget.onComplete.call();
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
