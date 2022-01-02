import 'package:apiexample/view/login/model/user_request_model.dart';
import 'package:apiexample/view/login/model/user_response_model.dart';
import 'package:dio/dio.dart';
import 'dart:io';

abstract class ILoginService {
  final String path = '/auth/sign-in';

  ILoginService(this.dio);

  Future<UserResponseModel?> fetchLogin(UserRequestModel model);
  final Dio dio;
}

class LoginService extends ILoginService {
  LoginService(Dio dio) : super(dio);

  @override
  Future<UserResponseModel?> fetchLogin(UserRequestModel model) async {
    final response = await dio.post(path, data: model);
    if (response.statusCode == HttpStatus.ok) {
      return UserResponseModel.fromJson(response.data);
    } else {
      throw Exception(
        'Veriler alınamadı. Hata Kodu: ${response.statusCode}',
      );
    }
  }
}
