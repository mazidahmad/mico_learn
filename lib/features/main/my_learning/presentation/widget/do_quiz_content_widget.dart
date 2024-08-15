import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/contents/image_content.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/contents/text_content.dart';
import 'package:mico_learn/features/main/my_learning/presentation/cubit/assessment_quiz_cubit.dart';

import '../../../../../core/theme/app_text_styles.dart';
import 'quiz/question_choice_item.dart';
import 'quiz/question_sequence_header.dart';

class DoQuizContentWidget extends StatelessWidget {
  const DoQuizContentWidget({super.key, required this.cubit});

  final AssessmentQuizCubit cubit;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      carouselController: cubit.carouselController,
      itemCount: cubit.state.quiz.questions.length,
      itemBuilder: (context, indexQuestion, realIndex) {
        var question = cubit.state.quiz.questions[indexQuestion];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  QuestionSequenceHeader(question: question),
                  const Gap(20),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: question.value.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      var content = question.value[index];

                      if (content is TextContent) {
                        return Column(
                          children: [
                            Text(
                              content.text,
                              textAlign: TextAlign.justify,
                              style: AppTextStyle.bodyMedium(),
                            ),
                            const Gap(12),
                          ],
                        );
                      }
                      if (content is ImageContent) {
                        return Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: content.url,
                              fit: BoxFit.scaleDown,
                            ),
                            const Gap(10),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                  const Gap(30),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: question.choices.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      var choice = question.choices[index];
                      return Column(
                        children: [
                          QuestionChoiceItem(
                              onTap: (choiceId) {
                                cubit.selectChoice(indexQuestion, choiceId);
                              },
                              choice: choice,
                              isSelected:
                                  cubit.state.selectedChoices[indexQuestion] ==
                                      choice.id),
                          const Gap(12),
                        ],
                      );
                    },
                  ),
                  const Gap(30),
                ],
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        enlargeFactor: 0,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        enableInfiniteScroll: false,
        enlargeCenterPage: false,
        viewportFraction: 1,
        height: screenSize.height,
        scrollPhysics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
