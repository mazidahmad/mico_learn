import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class Storage {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  Future<void> secureSave(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> secureRead(String key) async {
    return await secureStorage.read(key: key);
  }

  Future<void> deleteData(String key) async {
    return await secureStorage.delete(key: key);
  }
}
