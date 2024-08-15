import 'package:injectable/injectable.dart';
import 'package:mico_learn/core/di/service_locator.dart';
import 'package:mico_learn/core/network/supabase_module.dart';
import 'package:mico_learn/features/main/home/data/models/module_model.dart';

abstract class ModuleRemoteDatasource {
  Future<List<ModuleModel>> getModulesByCourseId(String courseId);
}

@Injectable(as: ModuleRemoteDatasource)
class ModuleRemoteDatasourceImpl extends ModuleRemoteDatasource {
  final SupabaseModule _supabaseModule = getIt<SupabaseModule>();

  @override
  Future<List<ModuleModel>> getModulesByCourseId(String courseId) async {
    var response = await _supabaseModule.client
        .from('module')
        .select('*, lesson(*)')
        .eq('course_id', courseId);

    return List.from(response)
        .map((data) => ModuleModel.fromMap(data))
        .toList();
  }
}
