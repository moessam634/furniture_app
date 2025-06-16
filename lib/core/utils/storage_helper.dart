import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  final storage = FlutterSecureStorage(
      aOptions: const AndroidOptions(encryptedSharedPreferences: true));

  Future saveToken(String value) async {
    await storage.write(key: "token", value: value);
  }

  Future<String?> getToken() async {
    return await storage.read(key: "token") ?? "";
  }

  Future<void> removeToken() async {
    await storage.delete(key: "token");
  }

  Future saveUserId(String value) async {
    await storage.write(key: "id", value: value);
  }

  Future<String?> getUserId() async {
    return await storage.read(key: "id") ?? "";
  }
}
