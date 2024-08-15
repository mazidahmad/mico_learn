import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/features/main/my_learning/domain/entities/contents/text_content.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class InsightContentWidget extends StatefulWidget {
  const InsightContentWidget({
    Key? key,
    this.title,
    required this.data,
    required this.onDone,
  }) : super(key: key);

  final String? title;
  final List<dynamic> data;
  final void Function() onDone;

  @override
  State<InsightContentWidget> createState() => _InsightContentWidgetState();
}

class _InsightContentWidgetState extends State<InsightContentWidget> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => widget.onDone.call());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.title != null)
              Text(
                widget.title!,
                style: AppTextStyle.labelLarge(),
              ),
            const Gap(20),
            ListView.builder(
              itemCount: widget.data.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                var content = widget.data[index];

                if (content is TextContent) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: index.isEven
                          ? AppColors.secondary
                          : AppColors.secondaryAlt,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        content.text,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.bodyMedium(
                            color: AppColors.bodyPrimary),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
