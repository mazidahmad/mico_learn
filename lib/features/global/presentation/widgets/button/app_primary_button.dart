import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    this.label,
    this.prefixIcon,
    this.color = AppColors.bodyOnPrimary,
    this.buttoncolor = AppColors.primary,
    this.onPressed,
    this.isLoading = false,
  });

  final String? label;
  final void Function()? onPressed;
  final Widget? prefixIcon;
  final Color color;
  final Color buttoncolor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttoncolor,
        side: BorderSide.none,
        shadowColor: null,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: isLoading
          ? const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(color: Colors.white),
              ),
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (prefixIcon != null)
                  Row(
                    children: [
                      prefixIcon!,
                      const Gap(11),
                    ],
                  ),
                if (label != null)
                  Text(
                    label!,
                    style: AppTextStyle.labelMedium(color: color),
                  ),
              ],
            ),
    );
  }
}
