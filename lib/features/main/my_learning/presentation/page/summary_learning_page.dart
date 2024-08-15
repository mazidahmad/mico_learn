import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/core/utils/learning_util.dart';
import 'package:mico_learn/features/main/home/presentation/widgets/summary_lesson_widget.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/learning_detail.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../auth/domain/entities/account.dart';
import '../../../../global/presentation/widgets/app_loading.dart';
import '../../../../startup/presentation/cubit/account_cubit.dart';
import '../../../home/presentation/cubit/summary_course_cubit.dart';

@RoutePage()
class SummaryLearningPage extends StatefulWidget {
  const SummaryLearningPage({super.key, required this.learningDetail});

  static const String routeName = "/summary";

  final LearningDetail learningDetail;

  @override
  State<SummaryLearningPage> createState() => _SummaryLearningPageState();
}

class _SummaryLearningPageState extends State<SummaryLearningPage> {
  late final SummaryCourseCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<SummaryCourseCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Rangkuman Belajar',
          style: AppTextStyle.headlineExtraSmall(),
        ),
      ),
      body: BlocProvider(
        create: (context) => _cubit
          ..getUserLessonQuizScores(widget.learningDetail.enrollment.id),
        child: BlocBuilder<SummaryCourseCubit, SummaryCourseState>(
          builder: (context, state) {
            if (state is SummaryCourseLoading) {
              return const Center(child: AppLoading());
            }
            if (state is SummaryCourseLoaded) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BlocBuilder<AccountCubit, Account?>(
                        bloc: getIt<AccountCubit>(),
                        builder: (context, account) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        const CachedNetworkImageProvider(
                                            'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/default-avatar-profile-picture-male-icon.png'),
                                    foregroundImage: CachedNetworkImageProvider(
                                      account?.profilePicture ?? '-',
                                    ),
                                  ),
                                  const Gap(12),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          account?.name ?? '-',
                                          style: AppTextStyle.labelMedium(
                                              color: AppColors.primary),
                                        ),
                                        Text(
                                          account?.email ?? '-',
                                          style: AppTextStyle.bodySmall(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Gap(20),
                                  CircularPercentIndicator(
                                    radius: 20,
                                    center: Text(
                                      LearningUtil.calculateTotalProgress(widget
                                          .learningDetail.enrollmentLessons),
                                      style: AppTextStyle.labelSmall(),
                                    ),
                                    percent: double.parse(
                                            LearningUtil.calculateTotalProgress(
                                                widget.learningDetail
                                                    .enrollmentLessons)) /
                                        100,
                                    progressColor: AppColors.primaryAlt,
                                    footer: Column(
                                      children: [
                                        Text(
                                          'Progress',
                                          style: AppTextStyle.labelSmall(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Gap(10),
                                  CircularPercentIndicator(
                                    radius: 20,
                                    center: Text(
                                      LearningUtil.calculateTotalScores(state
                                          .quisScores
                                          .map((e) => e.score)
                                          .toList()),
                                      style: AppTextStyle.labelSmall(),
                                    ),
                                    percent: double.parse(
                                            LearningUtil.calculateTotalScores(
                                                state.quisScores
                                                    .map((e) => e.score)
                                                    .toList())) /
                                        100,
                                    progressColor: AppColors.primaryAlt,
                                    footer: Column(
                                      children: [
                                        Text(
                                          'Score',
                                          style: AppTextStyle.labelSmall(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SummaryLessonWidget(
                          enrollmentId: widget.learningDetail.enrollment.id,
                          modules: widget.learningDetail.modules,
                          lessons: widget.learningDetail.enrollmentLessons)
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
