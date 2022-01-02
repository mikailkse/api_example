import 'package:apiexample/view/register/model/register_request_model.dart';
import 'package:dio/dio.dart';
import 'dart:io';

abstract class IRegisterService {
  final String path = '/auth/sign-up';

  IRegisterService(this.dio);

  Future<void> fetchRegister(RegisterRequestModel model);
  final Dio dio;
}

class RegisterService extends IRegisterService {
  RegisterService(Dio dio) : super(dio);

  @override
  Future<void> fetchRegister(RegisterRequestModel model) async {
    final response = await dio.post(path, data: model);
    if (response.statusCode == HttpStatus.ok) {
      return response.data;
    } else {
      throw Exception(
        'Veriler alınamadı. Hata Kodu: ${response.statusCode}',
      );
    }
  }
}
