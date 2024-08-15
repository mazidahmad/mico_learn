import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mico_learn/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/config/app_config.dart';
import 'core/di/service_locator.dart';
import 'features/global/presentation/widgets/loading.dart';

Future<void> main() async => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        configureDependencies();

        await Supabase.initialize(
          url: AppConfig.supabaseUrl,
          anonKey: AppConfig.supabaseKey,
        );
        LoadingWidget.configLoading();
        runApp(const MyApp());
      },
      (error, stack) {},
    );
