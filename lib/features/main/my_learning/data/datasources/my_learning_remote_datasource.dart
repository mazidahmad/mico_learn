import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/network/supabase_module.dart';
import 'package:mico_learn/features/main/home/data/models/course_model.dart';
import 'package:mico_learn/features/main/home/data/models/enrollment_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/assessment_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/assessment_quiz_record_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/assessment_result_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/assessment_session_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/content_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/enrollment_lesson_model.dart';
import 'package:mico_learn/features/main/my_learning/data/models/lesson_quiz_score.dart';
import 'package:mico_learn/features/main/my_learning/data/models/quiz_model.dart';
import 'package:mico_learn/features/startup/presentation/cubit/account_cubit.dart';

import '../../../../../core/config/app_url.dart';
import '../../../../../core/network/http_module.dart';
import '../../domain/entities/assessment_session.dart';
import '../models/enrollment_completion.dart';

abstract class MyLearningRemoteDatasource {
  Future<List<EnrollmentCompletionModel>> getUserEnrollments();
  Future<(EnrollmentModel, CourseModel)> getUserEnrollment(String enrollmentId);
  Future<List<EnrollmentLessonModel>> getEnrollmentLessons(String enrollmentId);
  Future<List<ContentModel>> getLessonContents(String lessonId);
  Future<void> submitLessonCompleted(String lessonId, String enrollmentId);
  Future<AssessmentSession> createAssessmentSession(
      String enrollmentId, String assessmentId);
  Future<void> submitQuiz(String assessmentSessionId, List<String> questionIds,
      List<String> questionChoiceIds);
  Future<List<LessonQuizScoreModel>> getUserLessonQuizScores(
      String enrollmentId);
  Future<List<AssessmentResultModel>> getLearningHistory(
      String lessonId, String enrollmentId);
  Future<AssessmentQuizRecordModel> getLearningEvaluation(
      String assessmentSessionId);
}

@Injectable(as: MyLearningRemoteDatasource)
class MyLearningRemoteDatasourceImpl extends MyLearningRemoteDatasource {
  final SupabaseModule _supabaseModule = getIt<SupabaseModule>();
  final HttpModule _httpModule = getIt<HttpModule>();

  @override
  Future<List<EnrollmentCompletionModel>> getUserEnrollments() async {
    var accountId = _supabaseModule.client.auth.currentUser!.id;
    var result = await _supabaseModule.client
        .from('enrollment_completion')
        .select()
        .eq('account_id', accountId);

    return List.from(result)
        .map((e) => EnrollmentCompletionModel.fromMap(e))
        .toList();
  }

  @override
  Future<(EnrollmentModel, CourseModel)> getUserEnrollment(
      String enrollmentId) async {
    var result = await _supabaseModule.client
        .from('enrollment')
        .select('*, course(*)')
        .eq('id', enrollmentId)
        .single();

    return (
      EnrollmentModel.fromMap(result),
      CourseModel.fromMap(result['course'])
    );
  }

  @override
  Future<List<EnrollmentLessonModel>> getEnrollmentLessons(
      String enrollmentId) async {
    var result = await _supabaseModule.client
        .from('enrollment_lesson')
        .select()
        .eq('enrollment_id', enrollmentId)
        .order('sequence_number', ascending: false);

    return List.from(result)
        .map((el) => EnrollmentLessonModel.fromMap(el))
        .toList();
  }

  @override
  Future<List<ContentModel>> getLessonContents(String lessonId) async {
    var isVip = getIt<AccountCubit>().state?.isVip ?? false;

    var result = isVip
        ? await _supabaseModule.client
            .from('content')
            .select()
            .eq('lesson_id', lessonId)
            .order('sequence', ascending: true)
        : await _supabaseModule.client
            .from('content')
            .select()
            .eq('is_vip', false)
            .eq('lesson_id', lessonId)
            .order('sequence', ascending: true);

    var data =
        List.from(result).map((data) => ContentModel.fromMap(data)).toList();

    for (var idx = 0; idx < data.length; idx++) {
      var content = data[idx];
      switch (content.type) {
        case 'assessment':
          var assessment = await getAssessment(content.value);
          var value = await getAssessmentValue(assessment);
          data[idx] = data[idx]
              .copyWith(value: assessment.copyWith(value: value))
              .toModel();
        default:
      }
    }

    return data;
  }

  @override
  Future<void> submitLessonCompleted(
      String lessonId, String enrollmentId) async {
    await _httpModule.sendPostRequest(ApiUrl.lessonCompletion,
        data: {'enrollment_id': enrollmentId, 'lesson_id': lessonId});
  }

  Future<AssessmentModel> getAssessment(String assessmentId) async {
    var response = await _supabaseModule.client
        .from('assessment')
        .select("*")
        .eq('id', assessmentId)
        .single();

    return AssessmentModel.fromMap(response);
  }

  Future<QuizModel> getAssessmentQuiz(String quizId) async {
    var result = await _supabaseModule.client
        .from('quiz')
        .select('*, question(*, choice(*), answer(*))')
        .eq('id', quizId)
        .single();

    return QuizModel.fromMap(result);
  }

  Future<dynamic> getAssessmentValue(AssessmentModel assessment) async {
    switch (assessment.type) {
      case 'execution_task':
        return null;
      default:
        var result = await getAssessmentQuiz(assessment.value);
        return result;
    }
  }

  @override
  Future<AssessmentSessionModel> createAssessmentSession(
      String enrollmentId, String assessmentId) async {
    var result = await _supabaseModule.client
        .from('assessment_session')
        .insert([
          {'assessment_id': assessmentId, 'enrollment_id': enrollmentId}
        ])
        .select()
        .single();

    return AssessmentSessionModel.fromMap(result);
  }

  @override
  Future<void> submitQuiz(String assessmentSessionId, List<String> questionIds,
      List<String> questionChoiceIds) async {
    var values = [];

    for (int idx = 0; idx < questionIds.length; idx++) {
      values.add({
        'assessment_session_id': assessmentSessionId,
        'question_id': questionIds[idx],
        'choice_id': questionChoiceIds[idx]
      });
    }

    await _supabaseModule.client
        .from('assessment_quiz_record')
        .insert(values)
        .select();
  }

  @override
  Future<List<LessonQuizScoreModel>> getUserLessonQuizScores(
      String enrollmentId) async {
    var result = await _supabaseModule.client
        .from('lesson_quiz_score')
        .select()
        .eq('enrollment_id', enrollmentId);

    return List.from(result)
        .map((e) => LessonQuizScoreModel.fromMap(e))
        .toList();
  }

  @override
  Future<List<AssessmentResultModel>> getLearningHistory(
      String lessonId, String enrollmentId) async {
    var result = await _supabaseModule.client
        .from('assessment_result')
        .select()
        .eq('lesson_id', lessonId)
        .eq('enrollment_id', enrollmentId)
        .order('created_at', ascending: true);

    return List.from(result)
        .map((e) => AssessmentResultModel.fromMap(e))
        .toList();
  }

  @override
  Future<AssessmentQuizRecordModel> getLearningEvaluation(
      String assessmentSessionId) async {
    var result = await _supabaseModule.client
        .from('assessment_quiz_record')
        .select('*, question(*, choice(*), answer(*))')
        .eq('assessment_session_id', assessmentSessionId)
        .single();

    return AssessmentQuizRecordModel.fromMap(result);
  }
}
