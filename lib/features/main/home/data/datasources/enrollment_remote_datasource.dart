import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/config/app_url.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/network/http_module.dart';
import 'package:mico_learn/core/network/supabase_module.dart';
import 'package:mico_learn/features/main/home/data/models/enrollment_model.dart';

abstract class EnrollmentRemoteDatasource {
  Future<EnrollmentModel> enrollCourse(String courseId);
  Future<EnrollmentModel?> checkEnrollmentStatus(String courseId);
}

@Injectable(as: EnrollmentRemoteDatasource)
class EnrollmentRemoteDatasourceImpl extends EnrollmentRemoteDatasource {
  final HttpModule _httpModule = getIt<HttpModule>();
  final SupabaseModule _supabaseModule = getIt<SupabaseModule>();

  @override
  Future<EnrollmentModel> enrollCourse(String courseId) async {
    var accountId = _supabaseModule.client.auth.currentUser!.id;
    var data = {
      'courseId': courseId,
      'accountId': accountId,
    };

    var response =
        await _httpModule.sendPostRequest(ApiUrl.enrollCourse, data: data);

    return EnrollmentModel.fromMap(response.data);
  }

  @override
  Future<EnrollmentModel?> checkEnrollmentStatus(String courseId) async {
    var accountId = _supabaseModule.client.auth.currentUser!.id;

    var response = await _supabaseModule.client
        .from('enrollment')
        .select()
        .eq('account_id', accountId)
        .eq('course_id', courseId)
        .maybeSingle();

    if (response == null || response.isEmpty) return null;

    return EnrollmentModel.fromMap(response);
  }
}
