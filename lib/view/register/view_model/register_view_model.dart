import 'package:apiexample/view/register/model/register_request_model.dart';
import 'package:apiexample/view/register/service/register_service.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../register/register.dart';

abstract class RegisterViewModel extends State<Register> {
  late final RegisterService registerService;
  final baseUrl = 'https://api.petinsafe.com/api';

  @override
  void initState() {
    super.initState();
    final dio = (Dio(BaseOptions(baseUrl: baseUrl)));
    dio.interceptors.add(PrettyDioLogger());
    registerService = RegisterService(dio);
  }

  Future<void> fetchUserRegister(
      String email, String password, String fullName, String country) async {
    final response = await registerService.fetchRegister(RegisterRequestModel(
      fullName: fullName,
      email: email,
      password: password,
      country: country,
    ));
  }
}
