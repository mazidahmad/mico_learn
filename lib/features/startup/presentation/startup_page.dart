import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/theme/app_asset.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';
import 'package:mico_learn/features/startup/presentation/cubit/startup_cubit.dart';
import 'package:mico_learn/routes/app_router.dart';
import 'package:mico_learn/routes/app_router.gr.dart';

@RoutePage()
class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  static const String routeName = '/startup';

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  late StartupCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<StartupCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _cubit..checkSession(),
        child: BlocConsumer<StartupCubit, StartupState>(
          listener: (context, state) {
            if (state is StartupLogedIn) {
              getIt<AppRouter>().replaceAll([const MainRoute()]);
            }
            if (state is StartupOnBoard) {
              getIt<AppRouter>().replaceAll([const OnBoardingRoute()]);
            }
          },
          builder: (context, state) {
            if (state is StartupLoading) {
              return const Center(child: AppLoading());
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      AppAsset.appLogo,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const Gap(12),
                  Text(
                    'MicoLearn',
                    style: AppTextStyle.headlineMedium(),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
