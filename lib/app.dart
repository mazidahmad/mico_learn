import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mico_learn/core/theme/app_theme.dart';

import 'core/di/service_locator.dart';
import 'routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final AppRouter _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));
    return MaterialApp.router(
      themeMode: ThemeMode.light,
      title: 'MicoLearn',
      theme: AppTheme.main(),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(
        builder: FToastBuilder(),
      ),
    );
  }
}
