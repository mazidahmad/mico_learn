import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/theme/app_asset.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';
import 'package:mico_learn/features/global/presentation/widgets/button/app_primary_button.dart';
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_complete_cubit.dart';
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_detail_cubit.dart';
import 'package:mico_learn/routes/app_router.dart';

@RoutePage()
class LearningCompletePage extends StatefulWidget {
  const LearningCompletePage(
      {super.key,
      required this.lessonId,
      required this.enrollmentId,
      required this.learningDetailCubit});

  static const String routeName = '/learning-complete';

  final String lessonId;
  final String enrollmentId;
  final LearningDetailCubit learningDetailCubit;

  @override
  State<LearningCompletePage> createState() => _LearningCompletePageState();
}

class _LearningCompletePageState extends State<LearningCompletePage> {
  late LearningCompleteCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<LearningCompleteCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppPrimaryButton(
            label: "Belajar Lagi",
            onPressed: () {
              widget.learningDetailCubit
                  .getUserLearningDetail(widget.enrollmentId);
              getIt<AppRouter>().maybePop(true);
            },
          ),
        )
      ],
      body: BlocProvider(
        create: (context) => _cubit
          ..updateLessonCompletion(widget.enrollmentId, widget.lessonId),
        child: BlocBuilder<LearningCompleteCubit, LearningCompleteState>(
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: state is LearningDetailLoading ? 1 : 0,
                      duration: const Duration(seconds: 1),
                      child: const AppLoading(),
                    ),
                    AnimatedOpacity(
                      duration: const Duration(seconds: 1),
                      opacity: state is LearningCompleteCompleted ? 1 : 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LottieBuilder.asset(
                            AppAsset.completeLesson,
                            width: 200,
                          ),
                          const Gap(30),
                          Text(
                            'Yeah! Kamu berhasil\nmempelajari hal baru',
                            textAlign: TextAlign.center,
                            style: AppTextStyle.labelLarge(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
