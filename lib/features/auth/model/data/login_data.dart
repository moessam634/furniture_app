import 'package:dio/dio.dart';

import '../login_model/login_model.dart';

class LoginData {
  final Dio dio = Dio();

  Future<LoginModel> login(
      {required String name, required String password}) async {
    try {
      final response = await dio.post(
        "https://zbooma.com/furniture_api/auth/login.php",
        data: {
          "name": name,
          "password": password,
        },
      );
      final loginModel = LoginModel.fromJson(response.data);
      return loginModel;
    } on DioException catch (error) {
      final message = error.response!.data["message"] ?? "Login failed";
      throw (message);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
