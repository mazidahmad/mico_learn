import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/mixin/messager_mixin.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';
import 'package:mico_learn/features/main/home/domain/entities/course.dart';
import 'package:mico_learn/features/main/home/presentation/cubit/course_detail_cubit.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'course_lesson_item.dart';

class CourseDetailModules extends StatefulWidget {
  const CourseDetailModules({super.key, required this.course});

  final Course course;

  @override
  State<CourseDetailModules> createState() => _CourseDetailModulesState();
}

class _CourseDetailModulesState extends State<CourseDetailModules>
    with MessagerMixin {
  late CourseDetailCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<CourseDetailCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..fetchModules(widget.course),
      child: BlocConsumer<CourseDetailCubit, CourseDetailState>(
        listener: (context, state) {
          if (state.status == CourseDetailStatus.failed) {}
        },
        builder: (context, state) {
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
                    '${state.modules.length}',
                    style: AppTextStyle.labelMedium(
                        color: AppColors.bodySecondary),
                  ),
                ],
              ),
              const Gap(9),
              if (state.status == CourseDetailStatus.loading)
                const Center(child: AppLoading()),
              Visibility(
                visible: state.status == CourseDetailStatus.loaded,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.modules.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CourseModuleItem(
                          module: state.modules[index],
                          onTap: () {},
                        ),
                        const Gap(10),
                      ],
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
