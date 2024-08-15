import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_history_cubit.dart';
import 'package:mico_learn/routes/app_router.dart';
import 'package:mico_learn/routes/app_router.gr.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../../home/presentation/widgets/lesson_score_item.dart';

@RoutePage()
class HistoryLearningPage extends StatefulWidget {
  const HistoryLearningPage(
      {super.key,
      required this.lessonTitle,
      required this.lessonId,
      required this.enrollmentId});

  final String lessonId;
  final String lessonTitle;
  final String enrollmentId;

  static const String routeName = '/history-learning';

  @override
  State<HistoryLearningPage> createState() => _HistoryLearningPageState();
}

class _HistoryLearningPageState extends State<HistoryLearningPage> {
  late final LearningHistoryCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<LearningHistoryCubit>();
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
          'Riwayat Belajar',
          style: AppTextStyle.headlineExtraSmall(),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            _cubit..getLearningHistory(widget.enrollmentId, widget.lessonId),
        child: BlocConsumer<LearningHistoryCubit, LearningHistoryState>(
          builder: (context, state) {
            if (state is LearningHistoryLoading) {
              return const Center(child: AppLoading());
            }
            if (state is LearningHistoryLoaded) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.histories.length,
                itemBuilder: (context, index) {
                  return LearningLessonHistoryItem(
                    title: widget.lessonTitle,
                    score: state.histories[index].score * 100,
                    doDate: state.histories[index].createdAt
                        .add(const Duration(hours: 7)),
                    onTap: () {
                      getIt<AppRouter>().push(
                        EvaluationRoute(
                            assessmentSessionId:
                                state.histories[index].assessmentSessionId),
                      );
                    },
                  );
                },
              );
            }
            return Container();
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
