import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/theme/app_colors.dart';
import 'package:mico_learn/features/auth/domain/entities/account.dart';
import 'package:mico_learn/features/global/presentation/widgets/button/app_primary_button.dart';
import 'package:mico_learn/features/main/web_view_page.dart';
import 'package:mico_learn/routes/app_router.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../routes/app_router.gr.dart';
import '../../../startup/presentation/cubit/account_cubit.dart';
import '../cubit/profile_cubit.dart';

class ProfilePager extends StatefulWidget {
  const ProfilePager({super.key});

  @override
  State<ProfilePager> createState() => _ProfilePagerState();
}

class _ProfilePagerState extends State<ProfilePager> {
  late final ProfileCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<ProfileCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppTextStyle.headlineExtraSmall(),
        ),
      ),
      body: BlocProvider(
        create: (context) => _cubit,
        child: BlocListener<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLogoutSuccess) {
              getIt<AppRouter>().replaceAll([const StartupRoute()]);
            }
          },
          child: BlocBuilder<AccountCubit, Account?>(
            bloc: getIt<AccountCubit>(),
            builder: (context, account) {
              return Center(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: const CachedNetworkImageProvider(
                                'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/default-avatar-profile-picture-male-icon.png'),
                            foregroundImage: CachedNetworkImageProvider(
                              account?.profilePicture ?? '-',
                            ),
                          ),
                          const Gap(12),
                          Text(
                            account?.name ?? '-',
                            style: AppTextStyle.headlineExtraSmall(
                                color: AppColors.primary),
                          ),
                          Text(
                            account?.email ?? '-',
                            style: AppTextStyle.bodySmall(),
                          ),
                          const Gap(20),
                          SizedBox(
                            width: 200,
                            child: AppPrimaryButton(
                              label: "Logout",
                              buttoncolor: AppColors.failed,
                              onPressed: () {
                                _cubit.logoutAccount();
                              },
                            ),
                          ),
                          const Gap(20),
                          SizedBox(
                            width: 200,
                            child: AppPrimaryButton(
                              label: "Kuesioner",
                              onPressed: () {
                                getIt<AppRouter>()
                                    .pushNamed(WebViewPage.routeName);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'MicoLearn v1.1.0',
                      style:
                          AppTextStyle.bodySmall(color: AppColors.primaryAlt),
                    ),
                    const Gap(20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
