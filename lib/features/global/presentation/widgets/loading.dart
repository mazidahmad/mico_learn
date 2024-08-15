import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mico_learn/features/global/presentation/widgets/app_loading.dart';

import '../../../../core/theme/app_colors.dart';

class LoadingWidget {
  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorColor = AppColors.primary
      ..radius = 24
      ..progressColor = AppColors.primary
      ..userInteractions = false
      ..indicatorWidget = const AppLoading()
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = Colors.white
      ..backgroundColor = Colors.white
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.black.withOpacity(0.5)
      ..contentPadding = const EdgeInsets.all(30)
      ..dismissOnTap = false;
  }
}
