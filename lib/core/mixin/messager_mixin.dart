import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../routes/app_router.dart';
import '../di/service_locator.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

enum ToastType { info, success, error }

enum FlushType { info, success, error }

mixin MessagerMixin {
  final FToast _toast =
      FToast().init(getIt<AppRouter>().navigatorKey.currentContext!);

  void showAppToast(
      {ToastType type = ToastType.info,
      required String message,
      bool isBottomPosition = true}) async {
    late Color toastColor;
    switch (type) {
      case ToastType.error:
        toastColor = Colors.red;
        break;
      case ToastType.success:
        toastColor = AppColors.success;
        break;
      default:
        toastColor = AppColors.primary;
    }
    _toast.showToast(
        toastDuration: const Duration(seconds: 3),
        child: Container(
          constraints: const BoxConstraints(minHeight: 40),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: toastColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              message,
              style: AppTextStyle.labelSmall(color: AppColors.bodyOnPrimary),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        gravity: isBottomPosition ? ToastGravity.BOTTOM : ToastGravity.TOP);
  }

  // Future<void> showAppModalBottomsheet(
  //         {required BuildContext context,
  //         required Widget Function(
  //                 BuildContext context, void Function(void Function()) setState)
  //             widget,
  //         String? title,
  //         bool isWithHandle = true,
  //         bool isBottomSafe = true}) =>
  //     showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       backgroundColor: AppColors.dark1,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(28),
  //           topRight: Radius.circular(28),
  //         ),
  //       ),
  //       builder: (_) => StatefulBuilder(
  //         builder: (context, setState) => SafeArea(
  //           bottom: isBottomSafe,
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               if (isWithHandle) ...[
  //                 Gap(12.h),
  //                 Container(
  //                   width: 80.w,
  //                   height: 3.h,
  //                   decoration: BoxDecoration(
  //                       color: AppColors.light4,
  //                       borderRadius: BorderRadius.circular(3)),
  //                 ),
  //               ],
  //               Gap(22.h),
  //               if (title != null) ...[
  //                 Text(
  //                   title,
  //                   style: AppTextStyle.largeLabel(color: AppColors.light4),
  //                 ),
  //                 Gap(18.h),
  //                 const Divider(),
  //               ],
  //               widget.call(context, setState),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );

  // OverlayEntry getOverlayEntry(Widget child) {
  //   return OverlayEntry(
  //     builder: (context) => BackdropFilter(
  //         filter: ImageFilter.blur(sigmaX: 10.w, sigmaY: 10.h),
  //         child: Dialog(child: child)),
  //   );
  // }

  // void showOverlayEntry(OverlayEntry entry) {
  //   Overlay.of(getIt<AppRouter>().navigatorKey.currentContext!).insert(entry);
  // }

  // void showPictureDialog(BuildContext context, String imageUrl) async {
  //   await showGeneralDialog(
  //     barrierDismissible: true,
  //     barrierLabel: '',
  //     barrierColor: AppColors.darkBg0,
  //     transitionDuration: const Duration(milliseconds: 500),
  //     pageBuilder: (ctx, anim1, anim2) => Dialog(
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(8),
  //         child: CachedNetworkImage(
  //             imageUrl: imageUrl, width: 200.w, fit: BoxFit.cover),
  //       ),
  //     ),
  //     transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
  //       filter:
  //           ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
  //       child: FadeTransition(
  //         opacity: anim1,
  //         child: child,
  //       ),
  //     ),
  //     context: context,
  //   );
  // }

  // void showAppDialog(BuildContext context,
  //     {String? title, String? description, required Widget child}) async {
  //   await showDialog(
  //     barrierColor: AppColors.light1.withOpacity(0.12),
  //     context: context,
  //     useSafeArea: true,
  //     builder: (context) {
  //       return BackdropFilter(
  //         filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
  //         child: Dialog(
  //           backgroundColor: Colors.transparent,
  //           shadowColor: Colors.transparent,
  //           child: Container(
  //             width: 280.w,
  //             decoration: BoxDecoration(
  //               color: AppColors.dark0,
  //               borderRadius: BorderRadius.circular(12),
  //             ),
  //             child: Padding(
  //               padding: title != null
  //                   ? EdgeInsets.only(top: 24.h, bottom: 12.h)
  //                   : EdgeInsets.zero,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   if (title != null)
  //                     Column(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsets.symmetric(
  //                             horizontal: 20.w,
  //                           ),
  //                           child: Column(
  //                             mainAxisSize: MainAxisSize.min,
  //                             children: [
  //                               Text(
  //                                 title,
  //                                 style: AppTextStyle.headline6(),
  //                                 textAlign: TextAlign.center,
  //                               ),
  //                               if (description != null)
  //                                 Column(
  //                                   children: [
  //                                     Gap(12.h),
  //                                     Text(
  //                                       description,
  //                                       style: AppTextStyle.body14(
  //                                           color: AppColors.light0),
  //                                       textAlign: TextAlign.center,
  //                                     ),
  //                                   ],
  //                                 ),
  //                             ],
  //                           ),
  //                         ),
  //                         Gap(24.h),
  //                         const Divider(height: 1),
  //                       ],
  //                     ),
  //                   child
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
