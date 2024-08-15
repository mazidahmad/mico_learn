import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/contents/image_content.dart';
import '../../domain/entities/contents/text_content.dart';
import '../cubit/assessment_quiz_cubit.dart';
import 'quiz/question_choice_item.dart';
import 'quiz/question_evaluation_header.dart';

class EvaluationQuizContent extends StatelessWidget {
  const EvaluationQuizContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssessmentQuizCubit, AssessmentQuizState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const Gap(12),
              Text(
                'Evaluasi',
                style: AppTextStyle.labelLarge(),
              ),
              const Gap(6),
              Text(
                state.quiz.title,
                style: AppTextStyle.labelLarge(),
              ),
              const Gap(12),
              const Divider(),
              const Gap(12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.quiz.questions.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  var question = state.quiz.questions[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        QuestionEvaluationHeader(
                            question: question,
                            choiceAnswerId: state.selectedChoices[index]),
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
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: question.answer.explanation?.length,
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
                                          style: AppTextStyle.bodyMedium(),
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
      },
    );
  }
}
