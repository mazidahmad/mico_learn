// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/foundation.dart' as _i20;
import 'package:flutter/material.dart' as _i15;
import 'package:mico_learn/features/auth/presentation/on_boarding_login_page.dart'
    as _i8;
import 'package:mico_learn/features/main/home/domain/entities/course.dart'
    as _i16;
import 'package:mico_learn/features/main/home/presentation/pages/course_detail_page.dart'
    as _i1;
import 'package:mico_learn/features/main/main_page.dart' as _i7;
import 'package:mico_learn/features/main/my_learning/domain/entities/learning_detail.dart'
    as _i18;
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_detail_cubit.dart'
    as _i17;
import 'package:mico_learn/features/main/my_learning/presentation/page/evaluation_page.dart'
    as _i2;
import 'package:mico_learn/features/main/my_learning/presentation/page/history_learning_page.dart'
    as _i3;
import 'package:mico_learn/features/main/my_learning/presentation/page/learning_detail_page.dart'
    as _i5;
import 'package:mico_learn/features/main/my_learning/presentation/page/learning_page.dart'
    as _i6;
import 'package:mico_learn/features/main/my_learning/presentation/page/summary_learning_page.dart'
    as _i11;
import 'package:mico_learn/features/main/my_learning/presentation/pages/learning_complete_page.dart'
    as _i4;
import 'package:mico_learn/features/main/my_learning/presentation/pages/video_fullscreen_page.dart'
    as _i12;
import 'package:mico_learn/features/main/web_view_page.dart' as _i13;
import 'package:mico_learn/features/onboard/presentation/on_boarding_page.dart'
    as _i9;
import 'package:mico_learn/features/startup/presentation/startup_page.dart'
    as _i10;
import 'package:video_player/video_player.dart' as _i19;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    CourseDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CourseDetailRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CourseDetailPage(
          key: args.key,
          course: args.course,
        ),
      );
    },
    EvaluationRoute.name: (routeData) {
      final args = routeData.argsAs<EvaluationRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.EvaluationPage(
          key: args.key,
          assessmentSessionId: args.assessmentSessionId,
        ),
      );
    },
    HistoryLearningRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryLearningRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HistoryLearningPage(
          key: args.key,
          lessonTitle: args.lessonTitle,
          lessonId: args.lessonId,
          enrollmentId: args.enrollmentId,
        ),
      );
    },
    LearningCompleteRoute.name: (routeData) {
      final args = routeData.argsAs<LearningCompleteRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LearningCompletePage(
          key: args.key,
          lessonId: args.lessonId,
          enrollmentId: args.enrollmentId,
          learningDetailCubit: args.learningDetailCubit,
        ),
      );
    },
    LearningDetailRoute.name: (routeData) {
      final args = routeData.argsAs<LearningDetailRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LearningDetailPage(
          key: args.key,
          enrollmentId: args.enrollmentId,
          onComplete: args.onComplete,
        ),
      );
    },
    LearningRoute.name: (routeData) {
      final args = routeData.argsAs<LearningRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LearningPage(
          key: args.key,
          lessonId: args.lessonId,
          enrollmentId: args.enrollmentId,
          learningDetailCubit: args.learningDetailCubit,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MainPage(),
      );
    },
    OnBoardingLoginRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnBoardingLoginPage(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnBoardingPage(),
      );
    },
    StartupRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.StartupPage(),
      );
    },
    SummaryLearningRoute.name: (routeData) {
      final args = routeData.argsAs<SummaryLearningRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.SummaryLearningPage(
          key: args.key,
          learningDetail: args.learningDetail,
        ),
      );
    },
    VideoFullscreenRoute.name: (routeData) {
      final args = routeData.argsAs<VideoFullscreenRouteArgs>();
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.VideoFullscreenPage(
          videoPlayerController: args.videoPlayerController,
          key: args.key,
        ),
      );
    },
    WebViewRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.WebViewPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CourseDetailPage]
class CourseDetailRoute extends _i14.PageRouteInfo<CourseDetailRouteArgs> {
  CourseDetailRoute({
    _i15.Key? key,
    required _i16.Course course,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          CourseDetailRoute.name,
          args: CourseDetailRouteArgs(
            key: key,
            course: course,
          ),
          initialChildren: children,
        );

  static const String name = 'CourseDetailRoute';

  static const _i14.PageInfo<CourseDetailRouteArgs> page =
      _i14.PageInfo<CourseDetailRouteArgs>(name);
}

class CourseDetailRouteArgs {
  const CourseDetailRouteArgs({
    this.key,
    required this.course,
  });

  final _i15.Key? key;

  final _i16.Course course;

  @override
  String toString() {
    return 'CourseDetailRouteArgs{key: $key, course: $course}';
  }
}

/// generated route for
/// [_i2.EvaluationPage]
class EvaluationRoute extends _i14.PageRouteInfo<EvaluationRouteArgs> {
  EvaluationRoute({
    _i15.Key? key,
    required String assessmentSessionId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          EvaluationRoute.name,
          args: EvaluationRouteArgs(
            key: key,
            assessmentSessionId: assessmentSessionId,
          ),
          initialChildren: children,
        );

  static const String name = 'EvaluationRoute';

  static const _i14.PageInfo<EvaluationRouteArgs> page =
      _i14.PageInfo<EvaluationRouteArgs>(name);
}

class EvaluationRouteArgs {
  const EvaluationRouteArgs({
    this.key,
    required this.assessmentSessionId,
  });

  final _i15.Key? key;

  final String assessmentSessionId;

  @override
  String toString() {
    return 'EvaluationRouteArgs{key: $key, assessmentSessionId: $assessmentSessionId}';
  }
}

/// generated route for
/// [_i3.HistoryLearningPage]
class HistoryLearningRoute
    extends _i14.PageRouteInfo<HistoryLearningRouteArgs> {
  HistoryLearningRoute({
    _i15.Key? key,
    required String lessonTitle,
    required String lessonId,
    required String enrollmentId,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          HistoryLearningRoute.name,
          args: HistoryLearningRouteArgs(
            key: key,
            lessonTitle: lessonTitle,
            lessonId: lessonId,
            enrollmentId: enrollmentId,
          ),
          initialChildren: children,
        );

  static const String name = 'HistoryLearningRoute';

  static const _i14.PageInfo<HistoryLearningRouteArgs> page =
      _i14.PageInfo<HistoryLearningRouteArgs>(name);
}

class HistoryLearningRouteArgs {
  const HistoryLearningRouteArgs({
    this.key,
    required this.lessonTitle,
    required this.lessonId,
    required this.enrollmentId,
  });

  final _i15.Key? key;

  final String lessonTitle;

  final String lessonId;

  final String enrollmentId;

  @override
  String toString() {
    return 'HistoryLearningRouteArgs{key: $key, lessonTitle: $lessonTitle, lessonId: $lessonId, enrollmentId: $enrollmentId}';
  }
}

/// generated route for
/// [_i4.LearningCompletePage]
class LearningCompleteRoute
    extends _i14.PageRouteInfo<LearningCompleteRouteArgs> {
  LearningCompleteRoute({
    _i15.Key? key,
    required String lessonId,
    required String enrollmentId,
    required _i17.LearningDetailCubit learningDetailCubit,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          LearningCompleteRoute.name,
          args: LearningCompleteRouteArgs(
            key: key,
            lessonId: lessonId,
            enrollmentId: enrollmentId,
            learningDetailCubit: learningDetailCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'LearningCompleteRoute';

  static const _i14.PageInfo<LearningCompleteRouteArgs> page =
      _i14.PageInfo<LearningCompleteRouteArgs>(name);
}

class LearningCompleteRouteArgs {
  const LearningCompleteRouteArgs({
    this.key,
    required this.lessonId,
    required this.enrollmentId,
    required this.learningDetailCubit,
  });

  final _i15.Key? key;

  final String lessonId;

  final String enrollmentId;

  final _i17.LearningDetailCubit learningDetailCubit;

  @override
  String toString() {
    return 'LearningCompleteRouteArgs{key: $key, lessonId: $lessonId, enrollmentId: $enrollmentId, learningDetailCubit: $learningDetailCubit}';
  }
}

/// generated route for
/// [_i5.LearningDetailPage]
class LearningDetailRoute extends _i14.PageRouteInfo<LearningDetailRouteArgs> {
  LearningDetailRoute({
    _i15.Key? key,
    required String enrollmentId,
    required void Function() onComplete,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          LearningDetailRoute.name,
          args: LearningDetailRouteArgs(
            key: key,
            enrollmentId: enrollmentId,
            onComplete: onComplete,
          ),
          initialChildren: children,
        );

  static const String name = 'LearningDetailRoute';

  static const _i14.PageInfo<LearningDetailRouteArgs> page =
      _i14.PageInfo<LearningDetailRouteArgs>(name);
}

class LearningDetailRouteArgs {
  const LearningDetailRouteArgs({
    this.key,
    required this.enrollmentId,
    required this.onComplete,
  });

  final _i15.Key? key;

  final String enrollmentId;

  final void Function() onComplete;

  @override
  String toString() {
    return 'LearningDetailRouteArgs{key: $key, enrollmentId: $enrollmentId, onComplete: $onComplete}';
  }
}

/// generated route for
/// [_i6.LearningPage]
class LearningRoute extends _i14.PageRouteInfo<LearningRouteArgs> {
  LearningRoute({
    _i15.Key? key,
    required String lessonId,
    required String enrollmentId,
    required _i17.LearningDetailCubit learningDetailCubit,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          LearningRoute.name,
          args: LearningRouteArgs(
            key: key,
            lessonId: lessonId,
            enrollmentId: enrollmentId,
            learningDetailCubit: learningDetailCubit,
          ),
          initialChildren: children,
        );

  static const String name = 'LearningRoute';

  static const _i14.PageInfo<LearningRouteArgs> page =
      _i14.PageInfo<LearningRouteArgs>(name);
}

class LearningRouteArgs {
  const LearningRouteArgs({
    this.key,
    required this.lessonId,
    required this.enrollmentId,
    required this.learningDetailCubit,
  });

  final _i15.Key? key;

  final String lessonId;

  final String enrollmentId;

  final _i17.LearningDetailCubit learningDetailCubit;

  @override
  String toString() {
    return 'LearningRouteArgs{key: $key, lessonId: $lessonId, enrollmentId: $enrollmentId, learningDetailCubit: $learningDetailCubit}';
  }
}

/// generated route for
/// [_i7.MainPage]
class MainRoute extends _i14.PageRouteInfo<void> {
  const MainRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OnBoardingLoginPage]
class OnBoardingLoginRoute extends _i14.PageRouteInfo<void> {
  const OnBoardingLoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          OnBoardingLoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingLoginRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnBoardingPage]
class OnBoardingRoute extends _i14.PageRouteInfo<void> {
  const OnBoardingRoute({List<_i14.PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.StartupPage]
class StartupRoute extends _i14.PageRouteInfo<void> {
  const StartupRoute({List<_i14.PageRouteInfo>? children})
      : super(
          StartupRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartupRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SummaryLearningPage]
class SummaryLearningRoute
    extends _i14.PageRouteInfo<SummaryLearningRouteArgs> {
  SummaryLearningRoute({
    _i15.Key? key,
    required _i18.LearningDetail learningDetail,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SummaryLearningRoute.name,
          args: SummaryLearningRouteArgs(
            key: key,
            learningDetail: learningDetail,
          ),
          initialChildren: children,
        );

  static const String name = 'SummaryLearningRoute';

  static const _i14.PageInfo<SummaryLearningRouteArgs> page =
      _i14.PageInfo<SummaryLearningRouteArgs>(name);
}

class SummaryLearningRouteArgs {
  const SummaryLearningRouteArgs({
    this.key,
    required this.learningDetail,
  });

  final _i15.Key? key;

  final _i18.LearningDetail learningDetail;

  @override
  String toString() {
    return 'SummaryLearningRouteArgs{key: $key, learningDetail: $learningDetail}';
  }
}

/// generated route for
/// [_i12.VideoFullscreenPage]
class VideoFullscreenRoute
    extends _i14.PageRouteInfo<VideoFullscreenRouteArgs> {
  VideoFullscreenRoute({
    required _i19.VideoPlayerController videoPlayerController,
    _i20.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          VideoFullscreenRoute.name,
          args: VideoFullscreenRouteArgs(
            videoPlayerController: videoPlayerController,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VideoFullscreenRoute';

  static const _i14.PageInfo<VideoFullscreenRouteArgs> page =
      _i14.PageInfo<VideoFullscreenRouteArgs>(name);
}

class VideoFullscreenRouteArgs {
  const VideoFullscreenRouteArgs({
    required this.videoPlayerController,
    this.key,
  });

  final _i19.VideoPlayerController videoPlayerController;

  final _i20.Key? key;

  @override
  String toString() {
    return 'VideoFullscreenRouteArgs{videoPlayerController: $videoPlayerController, key: $key}';
  }
}

/// generated route for
/// [_i13.WebViewPage]
class WebViewRoute extends _i14.PageRouteInfo<void> {
  const WebViewRoute({List<_i14.PageRouteInfo>? children})
      : super(
          WebViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'WebViewRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
