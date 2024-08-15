import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:mico_learn/features/main/home/presentation/pages/course_detail_page.dart';
import 'package:mico_learn/features/main/main_page.dart';
import 'package:mico_learn/features/auth/presentation/on_boarding_login_page.dart';
import 'package:mico_learn/features/main/my_learning/presentation/page/evaluation_page.dart';
import 'package:mico_learn/features/main/my_learning/presentation/page/history_learning_page.dart';
import 'package:mico_learn/features/main/my_learning/presentation/page/learning_detail_page.dart';
import 'package:mico_learn/features/main/my_learning/presentation/page/learning_page.dart';
import 'package:mico_learn/features/main/my_learning/presentation/page/summary_learning_page.dart';
import 'package:mico_learn/features/main/my_learning/presentation/pages/learning_complete_page.dart';
import 'package:mico_learn/features/main/my_learning/presentation/pages/video_fullscreen_page.dart';
import 'package:mico_learn/features/main/web_view_page.dart';
import 'package:mico_learn/features/onboard/presentation/on_boarding_page.dart';
import 'package:mico_learn/features/startup/presentation/startup_page.dart';
import 'package:mico_learn/routes/app_router.gr.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: StartupRoute.page,
            path: StartupPage.routeName,
            initial: true),
        AutoRoute(
          page: OnBoardingRoute.page,
          path: OnBoardingPage.routeName,
        ),
        AutoRoute(
          page: OnBoardingLoginRoute.page,
          path: OnBoardingLoginPage.routeName,
        ),
        AutoRoute(
          page: MainRoute.page,
          path: MainPage.routeName,
        ),
        AutoRoute(
          page: CourseDetailRoute.page,
          path: CourseDetailPage.routeName,
        ),
        AutoRoute(
          page: LearningDetailRoute.page,
          path: LearningDetailPage.routeName,
        ),
        AutoRoute(
          page: LearningRoute.page,
          path: LearningPage.routeName,
        ),
        AutoRoute(
          page: VideoFullscreenRoute.page,
          path: VideoFullscreenPage.routeName,
        ),
        AutoRoute(
          page: LearningCompleteRoute.page,
          path: LearningCompletePage.routeName,
        ),
        AutoRoute(
          page: WebViewRoute.page,
          path: WebViewPage.routeName,
        ),
        AutoRoute(
          page: SummaryLearningRoute.page,
          path: SummaryLearningPage.routeName,
        ),
        AutoRoute(
          page: HistoryLearningRoute.page,
          path: HistoryLearningPage.routeName,
        ),
        AutoRoute(
          page: EvaluationRoute.page,
          path: EvaluationPage.routeName,
        ),
      ];
}
