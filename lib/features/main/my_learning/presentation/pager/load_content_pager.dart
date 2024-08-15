import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:mico_learn/core/theme/app_asset.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';

class LoadContentPager extends StatelessWidget {
  const LoadContentPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(AppAsset.loadContent, width: 300),
          const Gap(24),
          Text(
            'Memuat konten...',
            style: AppTextStyle.headlineExtraSmall(),
          )
        ],
      ),
    );
  }
}
