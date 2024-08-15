import 'package:flutter/material.dart';
import 'package:mico_learn/features/global/presentation/widgets/navigation_bar/app_navigation_bar_item.dart';

import '../../../../../core/theme/app_colors.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.items,
  });

  final List<AppNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(color: AppColors.secondary),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: items,
        ),
      ),
    );
  }
}
