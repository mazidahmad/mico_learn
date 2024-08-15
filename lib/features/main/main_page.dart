import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/theme/app_asset.dart';
import 'package:mico_learn/features/global/presentation/widgets/navigation_bar/app_navigation_bar.dart';
import 'package:mico_learn/features/global/presentation/widgets/navigation_bar/app_navigation_bar_item.dart';
import 'package:mico_learn/features/main/home/presentation/pager/home_pager.dart';
import 'package:mico_learn/features/main/my_learning/presentation/pager/my_course_pager.dart';
import 'package:mico_learn/features/profile/presentation/pager/profile_pager.dart';
import 'package:mico_learn/features/startup/presentation/cubit/account_cubit.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPagerIndex = 0;

  final List<Widget> pagers = [
    const HomePager(),
    const MyCoursePager(),
    const ProfilePager()
  ];

  void changeIndex(int idx) {
    setState(() {
      currentPagerIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AccountCubit>()..getAccountInfo(),
      child: Scaffold(
        body: pagers[currentPagerIndex],
        bottomNavigationBar: AppNavigationBar(
          items: [
            AppNavigationBarItem(
              isActive: currentPagerIndex == 0,
              iconAsset: AppAsset.iconHome,
              onTap: () => changeIndex(0),
            ),
            AppNavigationBarItem(
              isActive: currentPagerIndex == 1,
              iconAsset: AppAsset.iconMyCourse,
              onTap: () => changeIndex(1),
            ),
            AppNavigationBarItem(
              isActive: currentPagerIndex == 2,
              iconAsset: AppAsset.iconProfile,
              onTap: () => changeIndex(2),
            )
          ],
        ),
      ),
    );
  }
}
