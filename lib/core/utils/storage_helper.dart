import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  final storage = FlutterSecureStorage(
      aOptions: const AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  Future saveToken(String value) async {
    await storage.write(key: "token", value: value);
  }

  Future<String?> getToken() async {
    return await storage.read(key: "token") ?? "";
  }

  Future<void> removeToken() async {
    await storage.delete(key: "token");
  }
}
