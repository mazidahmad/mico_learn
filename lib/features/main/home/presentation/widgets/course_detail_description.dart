import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CourseDetailDescription extends StatefulWidget {
  const CourseDetailDescription(
      {super.key, required this.courseName, required this.courseDescription});

  final String courseName;
  final String courseDescription;

  @override
  State<CourseDetailDescription> createState() =>
      _CourseDetailDescriptionState();
}

class _CourseDetailDescriptionState extends State<CourseDetailDescription> {
  bool _isMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.courseName,
          style: AppTextStyle.headlineExtraSmall(),
        ),
        const Gap(18),
        AnimatedContainer(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 500),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Text(
                widget.courseDescription,
                textAlign: TextAlign.justify,
                maxLines: _isMore ? null : 6,
                style: AppTextStyle.bodySmall(),
              ),
              Visibility(
                visible: !_isMore,
                child: Container(
                  height: 80,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColors.background,
                        AppColors.background.withOpacity(0)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const Gap(9),
        GestureDetector(
          onTap: () {
            setState(() {
              _isMore = !_isMore;
            });
          },
          child: Text(
            _isMore ? 'Lebih Sedikit' : 'Lebih Banyak',
            style: AppTextStyle.labelSmall(
              color: AppColors.primary,
            ),
          ),
        )
      ],
    );
  }
}
