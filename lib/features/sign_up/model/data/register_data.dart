import 'package:dio/dio.dart';

class RegisterData {
  final Dio dio = Dio();

  registerData({
    required String name,
    required String email,
    required String password,
  }) async {
    var response = await dio
        .post("https://zbooma.com/furniture_api/auth/register.php", data: {
      "name": name,
      "email": email,
      "password": password,
    });
    try {
      var userData = response.data;
      return userData;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
