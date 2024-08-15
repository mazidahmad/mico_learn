import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/mixin/messager_mixin.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/assessment.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/contents/infographic_content.dart';
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_cubit.dart';
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_detail_cubit.dart';
import 'package:mico_learn/features/main/my_learning/presentation/pager/load_content_pager.dart';
import 'package:mico_learn/features/main/my_learning/presentation/widget/slide_content_widget.dart';
import 'package:mico_learn/routes/app_router.dart';
import 'package:mico_learn/routes/app_router.gr.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../global/presentation/widgets/button/app_primary_button.dart';
import '../widget/assessment_quiz_content_widget.dart';
import '../widget/insight_content_widget.dart';
import '../widget/video_content_widget.dart';

@RoutePage()
class LearningPage extends StatefulWidget {
  const LearningPage(
      {super.key,
      required this.lessonId,
      required this.enrollmentId,
      required this.learningDetailCubit});

  final String lessonId;
  final String enrollmentId;
  final LearningDetailCubit learningDetailCubit;

  static const String routeName = '/learning';

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> with MessagerMixin {
  late final LearningCubit _cubit;
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  void initState() {
    _cubit = getIt<LearningCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          _cubit..initializeLearning(widget.enrollmentId, widget.lessonId),
      child: BlocBuilder<LearningCubit, LearningState>(
        builder: (context, state) {
          return Scaffold(
            persistentFooterButtons: (state.status != LearningStatus.loading &&
                    state.contents[_currentIndex].type != 'assessment')
                ? [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          if (_currentIndex > 0)
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AppPrimaryButton(
                                      buttoncolor: AppColors.primaryAlt,
                                      label: 'Sebelumnya',
                                      onPressed: () {
                                        _carouselController.previousPage();
                                      },
                                    ),
                                  ),
                                  const Gap(12)
                                ],
                              ),
                            ),
                          Expanded(
                            child: AppPrimaryButton(
                              label: _currentIndex ==
                                      state.completionContents.length - 1
                                  ? 'Selesai'
                                  : 'Selanjutnya',
                              onPressed: state.completionContents[_currentIndex]
                                  ? () async {
                                      if (_currentIndex ==
                                          state.completionContents.length - 1) {
                                        await getIt<AppRouter>().replace(
                                            LearningCompleteRoute(
                                                learningDetailCubit:
                                                    widget.learningDetailCubit,
                                                lessonId: widget.lessonId,
                                                enrollmentId:
                                                    widget.enrollmentId));
                                      } else {
                                        _carouselController.nextPage();
                                      }
                                    }
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    )
                  ]
                : null,
            body: BlocConsumer<LearningCubit, LearningState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  children: [
                    //* Learning Indicator Index
                    if (state.status != LearningStatus.loading)
                      SafeArea(
                        bottom: false,
                        child: AnimatedOpacity(
                          opacity: state.status == LearningStatus.loaded &&
                                  state.contents.length > 1
                              ? 1
                              : 0,
                          duration: const Duration(seconds: 1),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 12),
                                child: Row(
                                  children: List.generate(
                                    state.contents.length,
                                    (index) => Expanded(
                                      child: Container(
                                        height: 7,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: _currentIndex >= index
                                                ? AppColors.primary
                                                : AppColors.secondary),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // LOADING
                          AnimatedOpacity(
                            opacity:
                                state.status == LearningStatus.loading ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            child: const LoadContentPager(),
                          ),
                          // LOADED
                          AnimatedOpacity(
                            opacity:
                                state.status == LearningStatus.loaded ? 1 : 0,
                            duration: const Duration(seconds: 1),
                            child: CarouselSlider(
                              carouselController: _carouselController,
                              items: state.contents.map((content) {
                                switch (content.type) {
                                  case 'infographic':
                                    return InfographicContentWidget(
                                      content: content.value,
                                      onDone: () {
                                        _cubit.completeContent(_currentIndex);
                                      },
                                    );
                                  case 'video':
                                    return VideoContentWidget(
                                      content: content.value,
                                      onVideoComplete: () {
                                        _cubit.completeContent(_currentIndex);
                                      },
                                    );
                                  case 'insight':
                                    return InsightContentWidget(
                                      data: content.value,
                                      title: content.title,
                                      onDone: () {
                                        _cubit.completeContent(_currentIndex);
                                      },
                                    );
                                  case 'slide':
                                    return SlideContentWidget(
                                      slideContent: content.value,
                                      onDone: () {
                                        _cubit.completeContent(_currentIndex);
                                      },
                                    );
                                  case 'assessment':
                                    Assessment assessment = content.value;
                                    switch (assessment.type) {
                                      case 'execution_task':
                                      default:
                                        return AssessmentQuizContentWidget(
                                          assessment: assessment,
                                          title: content.title,
                                          assessmentSessionId:
                                              state.assessmentSession!.id,
                                          onSubmitted: () async {
                                            _cubit
                                                .completeContent(_currentIndex);
                                          },
                                          onDone: () async {
                                            if (_currentIndex ==
                                                state.completionContents
                                                        .length -
                                                    1) {
                                              await getIt<AppRouter>().replace(
                                                  LearningCompleteRoute(
                                                      learningDetailCubit: widget
                                                          .learningDetailCubit,
                                                      lessonId: widget.lessonId,
                                                      enrollmentId:
                                                          widget.enrollmentId));
                                            } else {
                                              _carouselController.nextPage();
                                            }
                                          },
                                        );
                                    }
                                  default:
                                    return Container();
                                }
                              }).toList(),
                              options: CarouselOptions(
                                  scrollPhysics:
                                      const NeverScrollableScrollPhysics(),
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                  enlargeFactor: 0,
                                  enableInfiniteScroll: false,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1,
                                  scrollDirection: Axis.horizontal,
                                  height: screenSize.height),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class InfographicContentWidget extends StatefulWidget {
  const InfographicContentWidget({
    super.key,
    required this.content,
    required this.onDone,
  });

  final InfographicContent content;
  final void Function() onDone;

  @override
  State<InfographicContentWidget> createState() =>
      _InfographicContentWidgetState();
}

class _InfographicContentWidgetState extends State<InfographicContentWidget> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5))
        .then((value) => widget.onDone.call());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      boundaryMargin: const EdgeInsets.all(20.0),
      minScale: 0.1,
      maxScale: 3,
      child: CachedNetworkImage(
        imageUrl: widget.content.imageUrl,
        placeholder: (context, imageProvider) => const AppLoading(),
      ),
    );
  }
}
