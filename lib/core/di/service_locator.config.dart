// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:mico_learn/core/di/register_module.dart' as _i65;
import 'package:mico_learn/core/log/log.dart' as _i46;
import 'package:mico_learn/core/network/http_module.dart' as _i37;
import 'package:mico_learn/core/network/supabase_module.dart' as _i36;
import 'package:mico_learn/core/storage/storage.dart' as _i38;
import 'package:mico_learn/features/auth/data/datasources/auth_local_datasource.dart'
    as _i64;
import 'package:mico_learn/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i43;
import 'package:mico_learn/features/auth/data/repositories/auth_repository_impl.dart'
    as _i63;
import 'package:mico_learn/features/auth/domain/repositories/auth_repository.dart'
    as _i62;
import 'package:mico_learn/features/auth/domain/usecases/sign_in_google.dart'
    as _i5;
import 'package:mico_learn/features/auth/presentation/cubit/login_cubit.dart'
    as _i6;
import 'package:mico_learn/features/main/home/data/datasources/enrollment_remote_datasource.dart'
    as _i41;
import 'package:mico_learn/features/main/home/data/datasources/home_remote_datasource.dart'
    as _i52;
import 'package:mico_learn/features/main/home/data/datasources/module_remote_datasource.dart'
    as _i42;
import 'package:mico_learn/features/main/home/data/repositories/enrollment_repository_impl.dart'
    as _i48;
import 'package:mico_learn/features/main/home/data/repositories/home_repository_impl.dart'
    as _i58;
import 'package:mico_learn/features/main/home/data/repositories/module_repository_impl.dart'
    as _i60;
import 'package:mico_learn/features/main/home/domain/repositories/enrollment_repository.dart'
    as _i47;
import 'package:mico_learn/features/main/home/domain/repositories/home_repository.dart'
    as _i57;
import 'package:mico_learn/features/main/home/domain/repositories/module_repository.dart'
    as _i59;
import 'package:mico_learn/features/main/home/domain/usecases/enrollment/check_enrollment_status.dart'
    as _i12;
import 'package:mico_learn/features/main/home/domain/usecases/enrollment/enroll_course.dart'
    as _i13;
import 'package:mico_learn/features/main/home/domain/usecases/get_available_courses.dart'
    as _i15;
import 'package:mico_learn/features/main/home/domain/usecases/get_modules_by_course_id.dart'
    as _i14;
import 'package:mico_learn/features/main/home/presentation/cubit/available_courses_cubit.dart'
    as _i19;
import 'package:mico_learn/features/main/home/presentation/cubit/course_detail_cubit.dart'
    as _i18;
import 'package:mico_learn/features/main/home/presentation/cubit/enrollment_cubit.dart'
    as _i16;
import 'package:mico_learn/features/main/home/presentation/cubit/summary_course_cubit.dart'
    as _i17;
import 'package:mico_learn/features/main/my_learning/data/datasources/my_learning_remote_datasource.dart'
    as _i49;
import 'package:mico_learn/features/main/my_learning/data/repositories/my_learning_repository_impl.dart'
    as _i51;
import 'package:mico_learn/features/main/my_learning/domain/repositories/my_learning_repository.dart'
    as _i50;
import 'package:mico_learn/features/main/my_learning/domain/usecases/create_assessment_session.dart'
    as _i28;
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_learning_evaluation.dart'
    as _i23;
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_learning_history.dart'
    as _i24;
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_lesson_contents.dart'
    as _i21;
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_user_enrollments.dart'
    as _i25;
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_user_learning_detail.dart'
    as _i22;
import 'package:mico_learn/features/main/my_learning/domain/usecases/get_user_lesson_quiz_scores.dart'
    as _i20;
import 'package:mico_learn/features/main/my_learning/domain/usecases/submit_assessment_quiz.dart'
    as _i27;
import 'package:mico_learn/features/main/my_learning/domain/usecases/update_lesson_completion.dart'
    as _i26;
import 'package:mico_learn/features/main/my_learning/presentation/cubit/assessment_quiz_cubit.dart'
    as _i34;
import 'package:mico_learn/features/main/my_learning/presentation/cubit/evaluation_cubit.dart'
    as _i35;
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_complete_cubit.dart'
    as _i31;
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_cubit.dart'
    as _i30;
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_detail_cubit.dart'
    as _i33;
import 'package:mico_learn/features/main/my_learning/presentation/cubit/learning_history_cubit.dart'
    as _i32;
import 'package:mico_learn/features/main/my_learning/presentation/cubit/my_learning_cubit.dart'
    as _i29;
import 'package:mico_learn/features/profile/data/datasource/profile_remote_datasource.dart'
    as _i61;
import 'package:mico_learn/features/profile/data/repository/profile_repository_impl.dart'
    as _i54;
import 'package:mico_learn/features/profile/domain/repository/profile_repository.dart'
    as _i53;
import 'package:mico_learn/features/profile/domain/usecases/logout_account.dart'
    as _i7;
import 'package:mico_learn/features/profile/presentation/cubit/profile_cubit.dart'
    as _i8;
import 'package:mico_learn/features/startup/data/datasource/startup_local_datasource.dart'
    as _i44;
import 'package:mico_learn/features/startup/data/datasource/startup_remote_datasource.dart'
    as _i45;
import 'package:mico_learn/features/startup/data/repositories/startup_repository_impl.dart'
    as _i56;
import 'package:mico_learn/features/startup/domain/repositories/startup_repository.dart'
    as _i55;
import 'package:mico_learn/features/startup/domain/usecases/get_account_info.dart'
    as _i9;
import 'package:mico_learn/features/startup/domain/usecases/is_has_session.dart'
    as _i10;
import 'package:mico_learn/features/startup/presentation/cubit/account_cubit.dart'
    as _i39;
import 'package:mico_learn/features/startup/presentation/cubit/startup_cubit.dart'
    as _i11;
import 'package:mico_learn/routes/app_router.dart' as _i40;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i4.Logger>(() => registerModule.logger);
  gh.factory<_i5.SignInGoogle>(() => _i5.SignInGoogle());
  gh.factory<_i6.LoginCubit>(() => _i6.LoginCubit());
  gh.factory<_i7.LogoutAccount>(() => _i7.LogoutAccount());
  gh.factory<_i8.ProfileCubit>(() => _i8.ProfileCubit());
  gh.factory<_i9.GetAccountInfo>(() => _i9.GetAccountInfo());
  gh.factory<_i10.IsHasSession>(() => _i10.IsHasSession());
  gh.factory<_i11.StartupCubit>(() => _i11.StartupCubit());
  gh.factory<_i12.CheckEnrollmentStatus>(() => _i12.CheckEnrollmentStatus());
  gh.factory<_i13.EnrollCourse>(() => _i13.EnrollCourse());
  gh.factory<_i14.GetModulesByCourseId>(() => _i14.GetModulesByCourseId());
  gh.factory<_i15.GetAvailableCourses>(() => _i15.GetAvailableCourses());
  gh.factory<_i16.EnrollmentCubit>(() => _i16.EnrollmentCubit());
  gh.factory<_i17.SummaryCourseCubit>(() => _i17.SummaryCourseCubit());
  gh.factory<_i18.CourseDetailCubit>(() => _i18.CourseDetailCubit());
  gh.factory<_i19.AvailableCoursesCubit>(() => _i19.AvailableCoursesCubit());
  gh.factory<_i20.GetUserLessonQuizScores>(
      () => _i20.GetUserLessonQuizScores());
  gh.factory<_i21.GetLessonContents>(() => _i21.GetLessonContents());
  gh.factory<_i22.GetUserLearningDetail>(() => _i22.GetUserLearningDetail());
  gh.factory<_i23.GetLearningEvaluation>(() => _i23.GetLearningEvaluation());
  gh.factory<_i24.GetLearningHistory>(() => _i24.GetLearningHistory());
  gh.factory<_i25.GetUserEnrollments>(() => _i25.GetUserEnrollments());
  gh.factory<_i26.UpdateLessonCompletion>(() => _i26.UpdateLessonCompletion());
  gh.factory<_i27.SubmitAssessmentQuiz>(() => _i27.SubmitAssessmentQuiz());
  gh.factory<_i28.CreateAssessmentSession>(
      () => _i28.CreateAssessmentSession());
  gh.factory<_i29.MyLearningCubit>(() => _i29.MyLearningCubit());
  gh.factory<_i30.LearningCubit>(() => _i30.LearningCubit());
  gh.factory<_i31.LearningCompleteCubit>(() => _i31.LearningCompleteCubit());
  gh.factory<_i32.LearningHistoryCubit>(() => _i32.LearningHistoryCubit());
  gh.factory<_i33.LearningDetailCubit>(() => _i33.LearningDetailCubit());
  gh.factory<_i34.AssessmentQuizCubit>(() => _i34.AssessmentQuizCubit());
  gh.factory<_i35.EvaluationCubit>(() => _i35.EvaluationCubit());
  gh.lazySingleton<_i36.SupabaseModule>(() => registerModule.supabaseModule);
  gh.lazySingleton<_i37.HttpModule>(() => registerModule.httpModule);
  gh.lazySingleton<_i38.Storage>(() => _i38.Storage());
  gh.lazySingleton<_i39.AccountCubit>(() => _i39.AccountCubit());
  gh.lazySingleton<_i40.AppRouter>(() => _i40.AppRouter());
  gh.factory<_i41.EnrollmentRemoteDatasource>(
      () => _i41.EnrollmentRemoteDatasourceImpl());
  gh.factory<_i42.ModuleRemoteDatasource>(
      () => _i42.ModuleRemoteDatasourceImpl());
  gh.factory<_i43.AuthRemoteDatasource>(() => _i43.AuthRemoteDatasourceImpl());
  gh.factory<_i44.StartupLocalDatasource>(
      () => _i44.StartupLocalDatasourceImpl());
  gh.factory<_i45.StartupRemoteDatasource>(
      () => _i45.StartupRemoteDatasourceImpl());
  gh.lazySingleton<_i46.Log>(() => _i46.Log(gh<_i4.Logger>()));
  gh.factory<_i47.EnrollmentRepository>(() => _i48.EnrollmentRepositoryImpl());
  gh.factory<_i49.MyLearningRemoteDatasource>(
      () => _i49.MyLearningRemoteDatasourceImpl());
  gh.factory<_i50.MyLearningRepository>(() => _i51.MyLearningRepositoryImpl());
  gh.factory<_i52.HomeRemoteDatasource>(() => _i52.HomeRemoteDatasourceImpl());
  gh.factory<_i53.ProfileRepository>(() => _i54.ProfileRepositoryImpl());
  gh.factory<_i55.StartupRepository>(() => _i56.StartupRepositoryImpl());
  gh.factory<_i57.HomeRepository>(() => _i58.HomeRepositoryImpl());
  gh.factory<_i59.ModuleRepository>(() => _i60.ModuleRepositoryImpl());
  gh.factory<_i61.ProfileRemoteDatasource>(
      () => _i61.ProfileRemoteDatasourceImpl());
  gh.factory<_i62.AuthRepository>(() => _i63.AuthRepositoryImpl());
  gh.factory<_i64.AuthLocalDatasource>(() => _i64.AuthLocalDatasourceImpl());
  return getIt;
}

class _$RegisterModule extends _i65.RegisterModule {}
