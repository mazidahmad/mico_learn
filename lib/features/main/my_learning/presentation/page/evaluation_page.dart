import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/contents/image_content.dart';
import '../../domain/entities/contents/text_content.dart';
import '../cubit/evaluation_cubit.dart';
import '../widget/quiz/question_choice_item.dart';
import '../widget/quiz/question_evaluation_header.dart';

@RoutePage()
class EvaluationPage extends StatefulWidget {
  const EvaluationPage({super.key, required this.assessmentSessionId});

  final String assessmentSessionId;

  static const String routeName = '/evaluation';

  @override
  State<EvaluationPage> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  late final EvaluationCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<EvaluationCubit>();
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
          'Evaluasi',
          style: AppTextStyle.headlineExtraSmall(),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            _cubit..getLearningEvaluation(widget.assessmentSessionId),
        child: BlocBuilder<EvaluationCubit, EvaluationState>(
          builder: (context, state) {
            if (state is EvaluationLoading) {
              return const Center(child: AppLoading());
            }
            if (state is EvaluationLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var question = state.record.question;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              QuestionEvaluationHeader(
                                  question: question,
                                  choiceAnswerId: state.record.choiceId),
                              const Gap(20),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: question.value.length,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var content = question.value[index];

                                  if (content is TextContent) {
                                    return Text(
                                      content.text,
                                      textAlign: TextAlign.justify,
                                      style: AppTextStyle.bodyMedium(),
                                    );
                                  }
                                  return Container();
                                },
                              ),
                              if (question.answer.choiceId !=
                                  state.record.choiceId)
                                Column(
                                  children: [
                                    const Gap(10),
                                    Text(
                                      'Jawaban Kamu :',
                                      style: AppTextStyle.labelMedium(),
                                    ),
                                    const Gap(12),
                                    QuestionChoiceItem(
                                      isCorrect: false,
                                      choice: question.choices
                                          .where((choice) =>
                                              choice.id ==
                                              state.record.choiceId)
                                          .single,
                                      onTap: (_) {},
                                    ),
                                  ],
                                ),
                              const Gap(10),
                              Text(
                                'Jawaban',
                                style: AppTextStyle.labelMedium(),
                              ),
                              const Gap(12),
                              QuestionChoiceItem(
                                isCorrect: true,
                                choice: question.choices
                                    .where((choice) =>
                                        choice.id == question.answer.choiceId)
                                    .single,
                                onTap: (_) {},
                              ),
                              if (question.answer.explanation != null)
                                Column(
                                  children: [
                                    const Gap(20),
                                    Text(
                                      'Pembahasan',
                                      style: AppTextStyle.labelMedium(),
                                    ),
                                    const Gap(10),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          question.answer.explanation?.length,
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (context, index) {
                                        var item =
                                            question.answer.explanation![index];

                                        if (item is ImageContent) {
                                          return CachedNetworkImage(
                                              imageUrl: item.url);
                                        } else {
                                          return Column(
                                            children: [
                                              Text(
                                                item,
                                                textAlign: TextAlign.justify,
                                                style:
                                                    AppTextStyle.bodyMedium(),
                                              ),
                                              const Gap(15),
                                            ],
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              const Divider(),
                            ],
                          ),
                        );
                      },
                    )
                  ],
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
