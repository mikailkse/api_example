// ignore_for_file: avoid_print

import 'package:apiexample/core/auth/auth_manager.dart';
import 'package:apiexample/core/cache/local_manager.dart';
import 'package:apiexample/view/home/home/home.dart';
import 'package:apiexample/view/home/model/user_model.dart';
import 'package:apiexample/view/login/login/login.dart';
import 'package:apiexample/view/login/model/user_request_model.dart';
import 'package:apiexample/view/login/service/login_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/src/provider.dart';

abstract class LoginViewModel extends State<Login> {
  LocaleManager localeManager = LocaleManager.instance;
  late final LoginService loginService;
  final baseUrl = 'https://api.petinsafe.com/api';

  @override
  void initState() {
    super.initState();
    final dio = (Dio(BaseOptions(baseUrl: baseUrl)));
    dio.interceptors.add(PrettyDioLogger());
    loginService = LoginService(dio);
  }

  Future<void> fetchUserLogin(String email, String password) async {
    final response = await loginService
        .fetchLogin(UserRequestModel(email: email, password: password));

    if (response != null) {
      localeManager.setStringValue(PreferencesKeys.TOKEN, response.token ?? '');
      navigateToHome();
      context.read<AuthenticationManager>().model = UserModel.fake();
    }
  }

  void navigateToHome() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Home()));
  }
}
