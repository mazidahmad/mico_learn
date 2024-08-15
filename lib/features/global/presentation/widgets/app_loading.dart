import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/theme/app_asset.dart';
import '../../../../core/theme/app_colors.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          AppAsset.micoLearnLogo,
          width: 20,
          height: 20,
        ),
        LoadingAnimationWidget.discreteCircle(
          thirdRingColor: AppColors.yellow,
          secondRingColor: AppColors.secondary,
          color: AppColors.primary,
          size: 50,
        )
      ],
    );
  }
}
