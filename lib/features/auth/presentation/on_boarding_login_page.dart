import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/mixin/messager_mixin.dart';
import 'package:mico_learn/core/theme/app_asset.dart';
import 'package:mico_learn/core/theme/app_colors.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/features/auth/presentation/cubit/login_cubit.dart';
import 'package:mico_learn/routes/app_router.dart';
import 'package:mico_learn/routes/app_router.gr.dart';

import '../../global/presentation/widgets/button/app_primary_button.dart';

@RoutePage()
class OnBoardingLoginPage extends StatefulWidget {
  const OnBoardingLoginPage({super.key});

  static const String routeName = '/on-boarding-login';

  @override
  State<OnBoardingLoginPage> createState() => _OnBoardingLoginPageState();
}

class _OnBoardingLoginPageState extends State<OnBoardingLoginPage>
    with MessagerMixin {
  late LoginCubit _loginCubit;

  @override
  void initState() {
    _loginCubit = getIt<LoginCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _loginCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (context) => _loginCubit,
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
              if (state is LoginSuccess) {
                getIt<AppRouter>().replaceAll([const StartupRoute()]);
              }
              if (state is LoginFailed) {
                showAppToast(
                    message: state.failure.message, type: ToastType.error);
              }
            }
          },
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAsset.illOnBoardingStart,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: Column(
                    children: [
                      const Gap(24),
                      Text.rich(
                        TextSpan(
                          text: 'Login dan mulai belajar\ndengan, ',
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
                        color: AppColors.bodyPrimary,
                        buttoncolor: AppColors.secondary,
                        prefixIcon: const FaIcon(
                          FontAwesomeIcons.google,
                          size: 19,
                          color: AppColors.bodyPrimary,
                        ),
                        onPressed: _loginCubit.loginWithGoogle,
                        label: 'Login dengan Google',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
