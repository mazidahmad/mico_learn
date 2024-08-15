import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/network/supabase_module.dart';
import 'package:mico_learn/features/main/home/data/models/course_model.dart';

abstract class HomeRemoteDatasource {
  Future<List<CourseModel>> getAvailableCourses();
}

@Injectable(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl extends HomeRemoteDatasource {
  final SupabaseModule _supabaseModule = getIt<SupabaseModule>();

  @override
  Future<List<CourseModel>> getAvailableCourses() async {
    var response = await _supabaseModule.client
        .from('course')
        .select('*, module(*, lesson(*))');

    return List.from(response)
        .map((data) => CourseModel.fromMap(data))
        .toList();
  }
}
