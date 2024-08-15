import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:mico_learn/core/config/app_config.dart';
import 'package:mico_learn/core/network/supabase_module.dart';

import '../log/printer/simple_log_printer.dart';
import '../network/http_module.dart';

@module
abstract class RegisterModule {
  GoogleSignIn get googleSignIn => GoogleSignIn(
      clientId: Platform.isAndroid
          ? AppConfig.androidClientId
          : AppConfig.iosClientId,
      serverClientId: AppConfig.webClientId);

  @LazySingleton()
  SupabaseModule get supabaseModule => SupabaseModule.initialize();

  Logger get logger => Logger(
        printer: SimpleLogPrinter(),
      );

  @LazySingleton()
  HttpModule get httpModule => HttpModule();
}
