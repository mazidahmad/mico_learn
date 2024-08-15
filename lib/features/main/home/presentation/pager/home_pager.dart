import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:mico_learn/core/theme/app_asset.dart';
import 'package:mico_learn/core/theme/app_text_styles.dart';
import 'package:mico_learn/features/auth/domain/entities/account.dart';
import 'package:mico_learn/features/startup/presentation/cubit/account_cubit.dart';

import '../../../../../core/theme/app_colors.dart';
import '../widgets/sections/available_courses_section.dart';

class HomePager extends StatefulWidget {
  const HomePager({super.key});

  @override
  State<HomePager> createState() => _HomePagerState();
}

class _HomePagerState extends State<HomePager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(20),
                    BlocBuilder<AccountCubit, Account?>(
                      builder: (context, account) {
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Halo 👋🏼,',
                                  style: AppTextStyle.labelMedium(),
                                ),
                                Text(
                                  account?.name ?? '-',
                                  style: AppTextStyle.labelMedium(),
                                )
                              ],
                            ),
                            const Spacer(),
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: const CachedNetworkImageProvider(
                                  'https://uxwing.com/wp-content/themes/uxwing/download/peoples-avatars/default-avatar-profile-picture-male-icon.png'),
                              foregroundImage: CachedNetworkImageProvider(
                                account?.profilePicture ?? '-',
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    const Gap(20),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SvgPicture.asset(
                                AppAsset.illOnBoarding,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: Text(
                              'Selamat Datang\ndi MicoLearn',
                              textAlign: TextAlign.left,
                              style: AppTextStyle.headlineExtraSmall(
                                  color: AppColors.bodyOnPrimary),
                            ),
                          ),
                          const Gap(20),
                        ],
                      ),
                    ),

                    // const LearnSeriesWidget(),
                    const Gap(29),
                    // Text(
                    //   'Lanjutkan Belajarmu',
                    //   style: AppTextStyle.labelMedium(),
                    // ),
                    // const Gap(20),
                    // Container(
                    //   width: double.maxFinite,
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 11, vertical: 10),
                    //   decoration: BoxDecoration(
                    //     color: AppColors.secondary,
                    //     borderRadius: BorderRadius.circular(12),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       ClipRRect(
                    //         borderRadius: BorderRadius.circular(12),
                    //         child: const Image(
                    //           width: 71,
                    //           height: 71,
                    //           fit: BoxFit.cover,
                    //           image: NetworkImage(
                    //               'https://assets-a1.kompasiana.com/items/album/2023/04/24/ct-64460b0e08a8b550603bb052.png'),
                    //         ),
                    //       ),
                    //       const Gap(14),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text(
                    //               'Computational Thinking',
                    //               style: AppTextStyle.labelMedium(),
                    //             ),
                    //             const Gap(13),
                    //             Row(
                    //               children: [
                    //                 const Expanded(
                    //                   child: LinearProgressIndicator(
                    //                     minHeight: 11,
                    //                     borderRadius: BorderRadius.all(
                    //                         Radius.circular(12)),
                    //                     color: AppColors.primary,
                    //                     backgroundColor: AppColors.background,
                    //                     value: 0.3,
                    //                   ),
                    //                 ),
                    //                 const Gap(7),
                    //                 Text(
                    //                   '20%',
                    //                   style: AppTextStyle.labelSmall(
                    //                       color: AppColors.primary),
                    //                 ),
                    //                 const Gap(5)
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // const Gap(30),
                  ],
                ),
              ),
              const AvailableCoursesSection()
            ],
          ),
        ),
      ),
    );
  }
}
