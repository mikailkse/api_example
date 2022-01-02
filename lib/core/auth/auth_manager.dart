import 'package:apiexample/core/cache/local_manager.dart';
import 'package:apiexample/view/home/model/user_model.dart';
import 'package:flutter/material.dart';

class AuthenticationManager {
  LocaleManager localeManager = LocaleManager.instance;
  BuildContext context;
  AuthenticationManager({
    required this.context,
  }) {
    fetchUserLogin();
  }

  bool isLogin = false;
  UserModel? model;

  Future<void> fetchUserLogin() async {
    final token = localeManager.getStringValue(PreferencesKeys.TOKEN);

    print("TOKEN ------>" + token);
    if (token == null) {
      isLogin = true;
    } else {
      isLogin = false;
    }
  }
}
