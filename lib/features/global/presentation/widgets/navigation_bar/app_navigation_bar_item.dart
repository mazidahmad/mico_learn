import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_colors.dart';

class AppNavigationBarItem extends StatelessWidget {
  const AppNavigationBarItem({
    super.key,
    this.isActive = false,
    required this.onTap,
    required this.iconAsset,
  });

  final bool isActive;
  final void Function() onTap;
  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColors.secondary : null,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 21),
        child: SvgPicture.asset(iconAsset),
      ),
    );
  }
}
