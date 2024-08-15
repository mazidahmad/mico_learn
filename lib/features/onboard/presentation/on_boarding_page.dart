import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/theme/app_asset.dart';
import 'package:mico_learn/core/theme/app_colors.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/features/auth/presentation/on_boarding_login_page.dart';
import 'package:mico_learn/routes/app_router.dart';

import '../../global/presentation/widgets/button/app_primary_button.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  static const String routeName = '/on-boarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAsset.illOnBoarding,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                children: [
                  const Gap(24),
                  Text.rich(
                    TextSpan(
                      text: 'Belajar Singkat\ndengan, ',
                      style: AppTextStyle.headlineSmall(),
                      children: [
                        TextSpan(
                          text: 'MicoLearn',
                          style: AppTextStyle.headlineSmall(
                              color: AppColors.primary),
                        ),
                        const TextSpan(
                          text: '!',
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(24),
                  AppPrimaryButton(
                    onPressed: () {
                      getIt<AppRouter>()
                          .pushNamed(OnBoardingLoginPage.routeName);
                    },
                    label: 'Mulai belajar',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
