import 'package:dio/dio.dart';

class LoginData {
  final Dio dio = Dio();

  loginData({required String name, required String password}) async {
    var response = await dio
        .post("https://zbooma.com/furniture_api/auth/login.php", data: {
      "name": name,
      "password": password,
    });
    try {
      var user = response.data;
      return user;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
