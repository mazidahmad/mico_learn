import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/mixin/messager_mixin.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';
import 'package:mico_learn/features/main/home/presentation/cubit/available_courses_cubit.dart';
import 'package:mico_learn/routes/app_router.gr.dart';

import '../../../../../../core/di/service_locator.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../routes/app_router.dart';
import '../course_card.dart';

class AvailableCoursesSection extends StatefulWidget {
  const AvailableCoursesSection({
    super.key,
  });

  @override
  State<AvailableCoursesSection> createState() =>
      _AvailableCoursesSectionState();
}

class _AvailableCoursesSectionState extends State<AvailableCoursesSection>
    with MessagerMixin {
  late AvailableCoursesCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<AvailableCoursesCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: double.maxFinite,
      color: AppColors.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Materi Tersedia',
            style: AppTextStyle.labelMedium(),
          ),
          const Gap(15),
          BlocProvider(
            create: (context) => _cubit..fetchAvailableCourses(),
            child: BlocConsumer<AvailableCoursesCubit, AvailableCoursesState>(
              listener: (context, state) {
                if (state is AvailableCoursesFailed) {
                  showAppToast(
                      message: state.failure.message, type: ToastType.error);
                }
              },
              builder: (context, state) {
                if (state is AvailableCoursesLoading) {
                  return const Center(child: AppLoading());
                } else if (state is AvailableCoursesLoaded) {
                  return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      itemCount: state.courses.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Row(
                            children: [
                              CourseCard(
                                courseName: state.courses[index].name,
                                sectionCount:
                                    state.courses[index].modules?.length ?? 0,
                                lessonCount: state.courses[index].totalLesson,
                                onTap: () => getIt<AppRouter>().push(
                                  CourseDetailRoute(
                                      course: state.courses[index]),
                                ),
                                courseImage:
                                    state.courses[index].bannerImage ?? '',
                              ),
                              const Gap(12),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
