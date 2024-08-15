import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData main() => ThemeData(
        colorScheme: AppColors.colorSchemeLight,
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ),
        primaryColor: AppColors.primary,
        dividerColor: Colors.transparent,
        hoverColor: Colors.white,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,

        //------------- App Bar -------------//
        appBarTheme: const AppBarTheme(
          foregroundColor: AppColors.bodyPrimary,
          backgroundColor: AppColors.background,
          surfaceTintColor: AppColors.background,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          centerTitle: true,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: AppColors.secondary)),
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.primary,
            opacity: 1,
            size: 20,
          ),
        ),

        //------------- Font -------------//
        textTheme: AppTextStyle.mainTextTheme,

        //------------- Text Selection -------------//
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.primary.withOpacity(.6),
          selectionColor: AppColors.primary.withOpacity(.5),
          selectionHandleColor: AppColors.primary.withOpacity(1),
        ),

        //------------- Elevated Button -------------//
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 56),
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),

        //------------- Tab Bar -------------//
        tabBarTheme: TabBarTheme(
          labelStyle: AppTextStyle.bodyMedium(fontWeight: FontWeight.w700),
          unselectedLabelStyle: AppTextStyle.bodyMedium(),
          dividerColor: AppColors.borderDivider,
          labelColor: AppColors.primary,
          indicatorColor: AppColors.primary,
          unselectedLabelColor: AppColors.secondary,
        ),

        //------------- Text Button -------------//
        textButtonTheme: TextButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),

        //------------- Outlined Button -------------//
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 48),
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.primary),
            ),
          ),
        ),

        //------------- Divider -------------//
        dividerTheme: const DividerThemeData(
            thickness: 1, color: AppColors.borderDivider),

        //------------- Transition -------------//
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        cupertinoOverrideTheme: const CupertinoThemeData(
          primaryColor: AppColors.primary,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.background,
        ),
        // colorScheme:
        //     ColorScheme.fromSwatch(primarySwatch: AppColors.primarySwatch)
        //         .copyWith(background: AppColors.backgroundDefault),
      );
}

mixin primaryColor {}
