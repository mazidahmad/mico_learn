import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/features/main/my_learning/presentation/widget/do_quiz_content_widget.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../global/presentation/widgets/button/app_primary_button.dart';
import '../../domain/entities/assessment.dart';
import '../../domain/entities/quiz.dart';
import '../cubit/assessment_quiz_cubit.dart';
import 'evaluation_quiz_content.dart';

class AssessmentQuizContentWidget extends StatefulWidget {
  const AssessmentQuizContentWidget({
    super.key,
    this.title,
    required this.assessment,
    required this.assessmentSessionId,
    required this.onSubmitted,
    required this.onDone,
  });

  final String? title;
  final Assessment assessment;
  final String assessmentSessionId;
  final void Function() onSubmitted;
  final void Function() onDone;

  @override
  State<AssessmentQuizContentWidget> createState() =>
      _AssessmentQuizContentWidgetState();
}

class _AssessmentQuizContentWidgetState
    extends State<AssessmentQuizContentWidget> {
  late Quiz quiz;
  late AssessmentQuizCubit _cubit;

  @override
  void initState() {
    quiz = widget.assessment.value;
    _cubit = getIt<AssessmentQuizCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..initialize(quiz),
      child: BlocConsumer<AssessmentQuizCubit, AssessmentQuizState>(
        listener: (context, state) {
          if (state.status == AssessmentQuizStatus.loading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
            if (state.status == AssessmentQuizStatus.submitted) {
              widget.onSubmitted.call();
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            persistentFooterButtons: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    if (state.currentIdx > 0 &&
                        state.currentIdx < state.selectedChoices.length)
                      Expanded(
                        child: Row(
                          children: [
                            AppPrimaryButton(
                              label: 'Sebelumnya',
                              onPressed: _cubit.previousQuestion,
                            ),
                            const Gap(12),
                          ],
                        ),
                      ),
                    Expanded(
                      child: AppPrimaryButton(
                        label: state.status == AssessmentQuizStatus.submitted
                            ? 'Selanjutnya'
                            : state.currentIdx ==
                                    state.selectedChoices.length - 1
                                ? 'Submit'
                                : 'Selanjutnya',
                        onPressed: state.status ==
                                AssessmentQuizStatus.submitted
                            ? widget.onDone.call
                            : (state.currentIdx <
                                        state.selectedChoices.length &&
                                    state.selectedChoices.length > 1)
                                ? _cubit.nextQuestion
                                : (state.selectedChoices
                                        .every((element) => element.isNotEmpty))
                                    ? () => _cubit
                                        .submitQuiz(widget.assessmentSessionId)
                                    : null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            body: state.status != AssessmentQuizStatus.submitted
                ? DoQuizContentWidget(cubit: _cubit)
                : const EvaluationQuizContent(),
          );
        },
      ),
    );
  }
}
