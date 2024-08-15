import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/mixin/messager_mixin.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';
import 'package:mico_learn/features/main/home/presentation/widgets/course_completion_card.dart';
import 'package:mico_learn/features/main/my_learning/presentation/cubit/my_learning_cubit.dart';
import 'package:mico_learn/routes/app_router.dart';
import 'package:mico_learn/routes/app_router.gr.dart';

class MyCoursePager extends StatefulWidget {
  const MyCoursePager({super.key});

  @override
  State<MyCoursePager> createState() => _MyCoursePagerState();
}

class _MyCoursePagerState extends State<MyCoursePager> with MessagerMixin {
  late MyLearningCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<MyLearningCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pelajaranku',
          style: AppTextStyle.headlineExtraSmall(),
        ),
      ),
      body: BlocProvider(
        create: (context) => _cubit..getUserEnrollments(),
        child: BlocConsumer<MyLearningCubit, MyLearningState>(
          listener: (context, state) {
            if (state is MyLearningFailed) {
              showAppToast(
                  message: state.failure.message, type: ToastType.error);
            }
          },
          builder: (context, state) {
            if (state is MyLearningLoading) {
              return const Center(child: AppLoading());
            }
            if (state is MyLearningLoaded) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              itemCount: state.enrollments.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CourseCompletionCard(
                                      courseName:
                                          state.enrollments[index].courseName,
                                      sectionCount:
                                          state.enrollments[index].totalModule,
                                      lessonCount:
                                          state.enrollments[index].totalLesson,
                                      percentage: state.enrollments[index]
                                          .completionPercentage,
                                      onTap: () => getIt<AppRouter>().push(
                                        LearningDetailRoute(
                                          enrollmentId: state
                                              .enrollments[index].enrollmentId,
                                          onComplete: () =>
                                              _cubit.getUserEnrollments(),
                                        ),
                                      ),
                                      courseImage:
                                          state.enrollments[index].bannerImage,
                                    ),
                                    const Gap(12),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
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
