import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/mixin/messager_mixin.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/features/global/presentation/widgets/button/app_primary_button.dart';
import 'package:mico_learn/features/main/home/domain/entities/course.dart';
import 'package:mico_learn/features/main/home/presentation/cubit/enrollment_cubit.dart';
import 'package:mico_learn/features/main/home/presentation/widgets/course_detail_header.dart';

import '../widgets/course_detail_description.dart';
import '../widgets/course_detail_lesson.dart';

@RoutePage()
class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key, required this.course});

  static const String routeName = '/course-detail';

  final Course course;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with MessagerMixin {
  late EnrollmentCubit _enrollmentCubit;

  @override
  void initState() {
    _enrollmentCubit = getIt<EnrollmentCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _enrollmentCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _enrollmentCubit..checkEnrollment(widget.course.id),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Detail Pelajaran',
            style: AppTextStyle.headlineExtraSmall(),
          ),
        ),
        persistentFooterButtons: [
          BlocConsumer<EnrollmentCubit, EnrollmentState>(
            listener: (context, state) {
              if (state.status == EnrollmentStatus.failed) {
                showAppToast(
                    message: state.failure!.message, type: ToastType.error);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppPrimaryButton(
                  label: state.enrollment == null
                      ? 'Langganan Belajar'
                      : 'Sudah Berlangganan',
                  isLoading: state.status == EnrollmentStatus.loading,
                  onPressed: state.enrollment == null
                      ? () {
                          _enrollmentCubit.enrollCourse(widget.course.id);
                        }
                      : null,
                ),
              );
            },
          )
        ],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  CourseDetailHeader(
                    sectionCount: widget.course.modules?.length ?? 0,
                    lessonCount: widget.course.totalLesson,
                    courseImage: widget.course.bannerImage ?? '-',
                  ),
                  const Gap(26),
                  CourseDetailDescription(
                    courseName: widget.course.name,
                    courseDescription: widget.course.description ?? '-',
                  ),
                  const Gap(17),
                  CourseDetailModules(course: widget.course)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
